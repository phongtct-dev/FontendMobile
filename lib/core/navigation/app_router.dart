import 'package:flutter/material.dart'; // THÊM IMPORT NÀY
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

// Import các page
import '../../features/auth/presentation/pages/forgot_password_page.dart';
import '../../features/auth/presentation/pages/login_page.dart';
import '../../features/auth/presentation/pages/register_page.dart';
import '../../features/auth/presentation/pages/verify_otp_page.dart';
import '../../features/auth/presentation/providers/auth_provider.dart';
import '../../features/cart/presentation/pages/cart_page.dart';
import '../../features/cart/presentation/pages/checkout_page.dart';
import '../../features/cart/presentation/pages/order_detail_page.dart';
import '../../features/cart/presentation/pages/order_success_page.dart';
import '../../features/cart/presentation/pages/orders_page.dart';
import '../../features/home/presentation/pages/home_page.dart';
import '../../features/home/presentation/pages/main_wrapper.dart';
import '../../features/profile/presentation/pages/contact_shop_page.dart';
import '../../features/profile/presentation/pages/profile_page.dart';
import '../../features/profile/presentation/pages/update_profile_page.dart';
import '../../features/profile/presentation/pages/warranty_policy_page.dart';
import '../../features/shop/presentation/pages/product_detail_page.dart';
import '../../features/shop/presentation/pages/shop_page.dart';

part 'app_router.g.dart';

class AppRoutes {
  // auth
  static const String login = '/login';
  static const String signup = '/signup';
  static const String verify = '/signup/verify';
  static const String forgotPassword = '/forgot-password';

  // trang chinh
  static const String home = '/';
  static const String shop = '/shop';
  static const String orders = '/orders';
  static const String profile = '/profile';

  // luồng mua hàng
  static const String cart = '/cart';
  static const String checkout = '/checkout';
  static const String updateProfile = '/update-profile';
  static const String orderSuccess = '/order-success';

  // chi tiết
  static const String productDetail = '/product-detail';
  static const String orderDetail = '/order-detail';

  // trong profile
  static const String warranty = '/warranty';
  static const String contact = '/contact';
}

// TẠO CLASS NÀY ĐỂ LẮNG NGHE TRẠNG THÁI MÀ KHÔNG LÀM SẬP GOROUTER
class RouterNotifier extends ChangeNotifier {
  RouterNotifier(this.ref) {
    ref.listen(authStateProvider, (_, __) => notifyListeners());
  }
  final Ref ref;
}

@riverpod
GoRouter router(RouterRef ref) {
  final notifier = RouterNotifier(ref);

  return GoRouter(
    initialLocation: AppRoutes.home,
    debugLogDiagnostics: true,
    refreshListenable: notifier, // Gắn Notifier vào đây để load lại route mượt mà
    redirect: (context, state) {
      // BẮT BUỘC DÙNG ref.read() TẠI ĐÂY THAY VÌ ref.watch()
      final authState = ref.read(authStateProvider);

      if (authState.isLoading) return null;

      final bool isLoggedIn = authState.valueOrNull != null;
      final String location = state.matchedLocation;

      final bool isPublicRoute =
          location == AppRoutes.login ||
              location == AppRoutes.signup ||
              location == AppRoutes.verify ||
              location == AppRoutes.forgotPassword;

      if (!isLoggedIn && !isPublicRoute) return AppRoutes.login;
      if (isLoggedIn && isPublicRoute) return AppRoutes.home;

      return null;
    },
    routes: [
      // --- 1. LUỒNG AUTH ---
      GoRoute(
        path: AppRoutes.login,
        builder: (context, state) => const LoginPage(),
      ),
      GoRoute(
        path: AppRoutes.forgotPassword,
        builder: (context, state) => const ForgotPasswordPage(),
      ),
      GoRoute(
        path: AppRoutes.signup,
        builder: (context, state) => const RegisterPage(),
        routes: [
          GoRoute(
            path: 'verify',
            builder: (context, state) {
              final email = state.extra as String? ?? '';
              return VerifyOtpPage(email: email);
            },
          ),
        ],
      ),

      // --- 2. LUỒNG GIỎ HÀNG & THANH TOÁN (Ẩn Bottom Bar) ---
      GoRoute(
        path: AppRoutes.cart,
        builder: (context, state) => const CartPage(),
      ),
      GoRoute(
        path: AppRoutes.checkout,
        builder: (context, state) => const CheckoutPage(),
      ),
      GoRoute(
        path: AppRoutes.updateProfile,
        builder: (context, state) => const UpdateProfilePage(),
      ),
      //  Order Success Page
      GoRoute(
        path: AppRoutes.orderSuccess,
        builder: (context, state) => const OrderSuccessPage(),
      ),

      GoRoute(
        path: '${AppRoutes.orderDetail}/:id',
        builder: (context, state) {
          final id = state.pathParameters['id']!;
          return OrderDetailPage(orderId: id);
        },
      ),

      // --- 3. LUỒNG CHÍNH (Có Bottom Bar) ---
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return MainWrapper(navigationShell: navigationShell);
        },
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRoutes.home,
                builder: (context, state) => const HomePage(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRoutes.shop,
                builder: (context, state) => const ShopPage(),
              ),
              GoRoute(
                path: '${AppRoutes.productDetail}/:id',
                builder: (context, state) {
                  final id = state.pathParameters['id']!;
                  return ProductDetailPage(productId: id);
                },
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(path: AppRoutes.orders, builder: (context, state) => const OrdersPage()),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                  path: AppRoutes.profile,
                  builder: (context, state) => const ProfilePage()
              ),
              GoRoute(
                path: AppRoutes.warranty,
                builder: (context, state) => const WarrantyPolicyPage(),
              ),
              GoRoute(
                path: AppRoutes.contact,
                builder: (context, state) => const ContactShopPage(),
              ),
            ],
          ),
        ],
      ),
    ],
  );
}