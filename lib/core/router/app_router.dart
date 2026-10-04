import 'package:go_router/go_router.dart';
import '../../features/auth/login_screen.dart';
import '../../features/auth/register_screen.dart';
import '../../features/home/home_screen.dart';
import '../../features/shell/main_shell.dart';
import '../../features/balance/balance_screen.dart';
import '../../features/transfer/transfer_screen.dart';
import '../../features/transfer/scan_qr_screen.dart';
import '../../features/transfer/my_qr_screen.dart';
import '../../features/catalog/services_screen.dart';
import '../../features/history/history_screen.dart';
import '../../features/points/points_screen.dart';
import '../../features/notifications/notifications_screen.dart';
import '../../features/profile/profile_screen.dart';
import '../../features/profile/settings_screen.dart';
import '../../features/merchant/merchant_screen.dart';
import '../../features/disbursement/disbursement_screen.dart';
import '../../features/auth/otp_screen.dart';

final appRouter = GoRouter(
  initialLocation: '/login',
  routes: [
    GoRoute(path: '/login', builder: (_, __) => const LoginScreen()),
    GoRoute(path: '/register', builder: (_, __) => const RegisterScreen()),
    GoRoute(path: '/otp', builder: (_, state) => OtpScreen(phone: state.extra as String? ?? '081234567890')),
    ShellRoute(
      builder: (_, __, child) => MainShell(child: child),
      routes: [
        GoRoute(path: '/home', builder: (_, __) => const HomeScreen()),
        GoRoute(path: '/history', builder: (_, __) => const HistoryScreen()),
        GoRoute(path: '/profile', builder: (_, __) => const ProfileScreen()),
      ],
    ),
    GoRoute(path: '/balance', builder: (_, __) => const BalanceScreen()),
    GoRoute(path: '/transfer', builder: (_, __) => const TransferScreen()),
    GoRoute(path: '/scan', builder: (_, __) => const ScanQrScreen()),
    GoRoute(path: '/my-qr', builder: (_, __) => const MyQrScreen()),
    GoRoute(path: '/services', builder: (_, __) => const ServicesScreen()),
    GoRoute(path: '/points', builder: (_, __) => const PointsScreen()),
    GoRoute(path: '/notifications', builder: (_, __) => const NotificationsScreen()),
    GoRoute(path: '/settings', builder: (_, __) => const SettingsScreen()),
    GoRoute(path: '/merchant', builder: (_, __) => const MerchantScreen()),
    GoRoute(path: '/disbursement', builder: (_, __) => const DisbursementScreen()),
  ],
);