import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/navigation/app_router.dart';
import '../providers/register_provider.dart';

class RegisterPage extends ConsumerStatefulWidget {
  const RegisterPage({super.key});

  @override
  ConsumerState<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends ConsumerState<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  bool _isPasswordVisible = false;

  void _onRegister() async {
    if (_formKey.currentState!.validate()) {
      FocusScope.of(context).unfocus();

      final success = await ref.read(registerStateProvider.notifier).signUp(
        _nameController.text.trim(),
        _emailController.text.trim(),
        _passwordController.text.trim(),
      );

      if (success && mounted) {
        context.push(AppRoutes.verify, extra: _emailController.text.trim());
      }
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(registerStateProvider);
    final theme = Theme.of(context);

    // Lắng nghe lỗi
    ref.listen(registerStateProvider, (prev, next) {
      next.whenOrNull(error: (err, _) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(err.toString().replaceAll("Exception: ", "")),
            backgroundColor: Colors.red.shade600,
            behavior: SnackBarBehavior.floating,
          ),
        );
      });
    });

    return Scaffold(
      backgroundColor: theme.colorScheme.background,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new, color: theme.colorScheme.onBackground),
          onPressed: () => context.pop(),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 10.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text("Tạo tài khoản", style: TextStyle(fontSize: 32, fontWeight: FontWeight.w900, color: theme.colorScheme.primary)),
                const SizedBox(height: 8),
                Text("Vui lòng điền thông tin bên dưới", style: TextStyle(color: Colors.grey.shade600, fontSize: 16)),
                const SizedBox(height: 32),

                // Họ và Tên
                TextFormField(
                  controller: _nameController,
                  decoration: InputDecoration(
                    labelText: "Họ và Tên",
                    prefixIcon: const Icon(Icons.person_outline),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                    filled: true, fillColor: theme.colorScheme.surface,
                  ),
                  validator: (v) => v!.isEmpty ? "Vui lòng nhập họ tên" : null,
                ),
                const SizedBox(height: 20),

                // Email
                TextFormField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    labelText: "Email",
                    prefixIcon: const Icon(Icons.email_outlined),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                    filled: true, fillColor: theme.colorScheme.surface,
                  ),
                  validator: (v) {
                    if (v == null || v.isEmpty) return "Vui lòng nhập email";
                    // Regex kiểm tra email chuẩn
                    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
                    if (!emailRegex.hasMatch(v)) return "Email không hợp lệ";
                    return null;
                  },
                ),
                const SizedBox(height: 20),

                // Mật khẩu (Có validate chuẩn)
                TextFormField(
                  controller: _passwordController,
                  obscureText: !_isPasswordVisible,
                  decoration: InputDecoration(
                    labelText: "Mật khẩu",
                    prefixIcon: const Icon(Icons.lock_outline),
                    suffixIcon: IconButton(
                      icon: Icon(_isPasswordVisible ? Icons.visibility : Icons.visibility_off, color: Colors.grey),
                      onPressed: () => setState(() => _isPasswordVisible = !_isPasswordVisible),
                    ),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                    filled: true, fillColor: theme.colorScheme.surface,
                    helperText: "Tối thiểu 6 ký tự, gồm chữ hoa, chữ thường & số",
                    helperMaxLines: 2,
                  ),
                  validator: (v) {
                    if (v == null || v.isEmpty) return "Vui lòng nhập mật khẩu";
                    // Regex kiểm tra: ít nhất 1 thường, 1 hoa, 1 số, min 6 ký tự
                    final passRegex = RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d).{6,}$');
                    if (!passRegex.hasMatch(v)) {
                      return "Mật khẩu chưa đủ mạnh (Cần Hoa, Thường, Số và >= 6 ký tự)";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 40),

                // Nút Đăng ký
                ElevatedButton(
                  onPressed: state.isLoading ? null : _onRegister,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: theme.colorScheme.primary,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    elevation: 2,
                  ),
                  child: state.isLoading
                      ? const SizedBox(height: 20, width: 20, child: CircularProgressIndicator(color: Colors.white, strokeWidth: 2))
                      : const Text("ĐĂNG KÝ", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, letterSpacing: 1.2)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}