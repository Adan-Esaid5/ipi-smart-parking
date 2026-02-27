import 'package:go_router/go_router.dart';

import '../auth/login_screen.dart';
import '../auth/signup_screen.dart';
import '../home/home_screen.dart';
import '../splash/splash_screen.dart';

import '../gps/gps_screen.dart';
import '../parking/parking_lots_screen.dart';
import '../parking/parking_details_screen.dart';
import '../parking/active_session_screen.dart';

import '../payments/payments_screen.dart';
import '../payments/pelecard_checkout_screen.dart';

import '../history/history_screen.dart';
import '../media/media_screen.dart';
import '../contact/contact_screen.dart';
import '../about/about_screen.dart';
import '../admin/admin_screen.dart';

class AppRouter {
  static final router = GoRouter(
    initialLocation: '/splash',
    routes: [
      GoRoute(path: '/splash', builder: (c, s) => const SplashScreen()),
      GoRoute(path: '/login', builder: (c, s) => const LoginScreen()),
      GoRoute(path: '/signup', builder: (c, s) => const SignupScreen()),

      GoRoute(path: '/home', builder: (c, s) => const HomeScreen()),

      GoRoute(path: '/gps', builder: (c, s) => const GpsScreen()),
      GoRoute(path: '/parking-lots', builder: (c, s) => const ParkingLotsScreen()),
      GoRoute(
        path: '/parking-details/:id',
        builder: (c, s) => ParkingDetailsScreen(parkingId: s.pathParameters['id']!),
      ),
      GoRoute(path: '/active-session', builder: (c, s) => const ActiveSessionScreen()),

      GoRoute(path: '/payments', builder: (c, s) => const PaymentsScreen()),
      GoRoute(path: '/pelecard', builder: (c, s) => const PelecardCheckoutScreen()),

      GoRoute(path: '/history', builder: (c, s) => const HistoryScreen()),
      GoRoute(path: '/media', builder: (c, s) => const MediaScreen()),
      GoRoute(path: '/contact', builder: (c, s) => const ContactScreen()),
      GoRoute(path: '/about', builder: (c, s) => const AboutScreen()),
      GoRoute(path: '/admin', builder: (c, s) => const AdminScreen()),
    ],
  );
}