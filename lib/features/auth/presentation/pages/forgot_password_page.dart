import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../providers/forgot_password_provider.dart';

class ForgotPasswordPage extends ConsumerStatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  ConsumerState<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends ConsumerState<ForgotPasswordPage> {
  final _emailController = TextEditingController();
  final _codeController = TextEditingController();
  final _newPasswordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  bool _isCodeSent = false; // Quản lý trạng thái màn hình
  bool _isPasswordVisible = false;

  void _handleSendCode() async {
    if (_emailController.text.trim().isEmpty || !_emailController.text.contains('@')) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Email không hợp lệ"), backgroundColor: Colors.red));
      return;
    }

    FocusScope.of(context).unfocus();
    final success = await ref.read(forgotPasswordNotifierProvider.notifier).sendCode(_emailController.text.trim());

    if (success && mounted) {
      setState(() => _isCodeSent = true); // Đổi form mượt mà
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Mã xác nhận đã gửi về Email!"), backgroundColor: Colors.green));
    }
  }

  void _handleResetPassword() async {
    if (_formKey.currentState!.validate()) {
      FocusScope.of(context).unfocus();
      final success = await ref.read(forgotPasswordNotifierProvider.notifier).resetPassword(
        _emailController.text.trim(),
        _codeController.text.trim(),
        _newPasswordController.text.trim(),
      );

      if (success && mounted) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Đổi mật khẩu thành công! Hãy đăng nhập."), backgroundColor: Colors.green));
        context.pop(); // Quay về trang Login
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(forgotPasswordNotifierProvider);
    final theme = Theme.of(context);

    // Bắt lỗi hiển thị
    ref.listen(forgotPasswordNotifierProvider, (prev, next) {
      next.whenOrNull(error: (err, _) => ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(err.toString()), backgroundColor: Colors.red)));
    });

    return Scaffold(
      backgroundColor: theme.colorScheme.background,
      appBar: AppBar(backgroundColor: Colors.transparent, elevation: 0),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 10.0),
          child: AnimatedSwitcher( // Tạo hiệu ứng chuyển form mượt mà
            duration: const Duration(milliseconds: 500),
            child: !_isCodeSent ? _buildEmailForm(theme, state.isLoading) : _buildResetForm(theme, state.isLoading),
          ),
        ),
      ),
    );
  }

  // FORM 1: Nhập Email
  Widget _buildEmailForm(ThemeData theme, bool isLoading) {
    return Column(
      key: const ValueKey(1),
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Icon(Icons.lock_reset, size: 80, color: theme.colorScheme.primary),
        const SizedBox(height: 16),
        Text("Quên mật khẩu?", style: TextStyle(fontSize: 28, fontWeight: FontWeight.w900, color: theme.colorScheme.primary), textAlign: TextAlign.center),
        const SizedBox(height: 8),
        Text("Nhập email của bạn để nhận mã khôi phục", style: TextStyle(color: Colors.grey.shade600, fontSize: 16), textAlign: TextAlign.center),
        const SizedBox(height: 32),
        TextField(
          controller: _emailController,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(labelText: "Email", prefixIcon: const Icon(Icons.email_outlined), border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)), filled: true, fillColor: theme.colorScheme.surface),
        ),
        const SizedBox(height: 24),
        ElevatedButton(
          onPressed: isLoading ? null : _handleSendCode,
          style: ElevatedButton.styleFrom(backgroundColor: theme.colorScheme.primary, foregroundColor: Colors.white, padding: const EdgeInsets.symmetric(vertical: 16), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
          child: isLoading ? const CircularProgressIndicator(color: Colors.white) : const Text("GỬI MÃ KHÔI PHỤC", style: TextStyle(fontWeight: FontWeight.bold)),
        ),
      ],
    );
  }

  // FORM 2: Nhập Mã & Pass mới
  Widget _buildResetForm(ThemeData theme, bool isLoading) {
    return Form(
      key: _formKey,
      child: Column(
        key: const ValueKey(2),
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Icon(Icons.mark_email_read_outlined, size: 80, color: theme.colorScheme.primary),
          const SizedBox(height: 16),
          Text("Đặt lại mật khẩu", style: TextStyle(fontSize: 28, fontWeight: FontWeight.w900, color: theme.colorScheme.primary), textAlign: TextAlign.center),
          const SizedBox(height: 8),
          Text("Vui lòng kiểm tra email ${_emailController.text}", style: TextStyle(color: Colors.grey.shade600, fontSize: 16), textAlign: TextAlign.center),
          const SizedBox(height: 32),
          TextFormField(
            controller: _codeController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(labelText: "Mã xác nhận (6 số)", prefixIcon: const Icon(Icons.pin_outlined), border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)), filled: true, fillColor: theme.colorScheme.surface),
            validator: (v) => (v == null || v.isEmpty) ? "Vui lòng nhập mã" : null,
          ),
          const SizedBox(height: 16),
          TextFormField(
            controller: _newPasswordController,
            obscureText: !_isPasswordVisible,
            decoration: InputDecoration(
              labelText: "Mật khẩu mới", prefixIcon: const Icon(Icons.lock_outline),
              suffixIcon: IconButton(icon: Icon(_isPasswordVisible ? Icons.visibility : Icons.visibility_off), onPressed: () => setState(() => _isPasswordVisible = !_isPasswordVisible)),
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)), filled: true, fillColor: theme.colorScheme.surface,
              helperText: "Tối thiểu 6 ký tự, gồm chữ hoa, chữ thường & số",
            ),
            validator: (v) {
              final passRegex = RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d).{6,}$');
              if (v == null || !passRegex.hasMatch(v)) return "Mật khẩu chưa đủ mạnh";
              return null;
            },
          ),
          const SizedBox(height: 24),
          ElevatedButton(
            onPressed: isLoading ? null : _handleResetPassword,
            style: ElevatedButton.styleFrom(backgroundColor: Colors.green, foregroundColor: Colors.white, padding: const EdgeInsets.symmetric(vertical: 16), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
            child: isLoading ? const CircularProgressIndicator(color: Colors.white) : const Text("XÁC NHẬN ĐỔI MẬT KHẨU", style: TextStyle(fontWeight: FontWeight.bold)),
          ),
          TextButton(onPressed: () => setState(() => _isCodeSent = false), child: const Text("Đổi email khác")),
        ],
      ),
    );
  }
}