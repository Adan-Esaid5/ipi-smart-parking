// import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';
// import '../theme/app_theme.dart';

// class HomeScreen extends StatelessWidget {
//   const HomeScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final titleStyle = Theme.of(context).textTheme.headlineLarge?.copyWith(
//           fontWeight: FontWeight.w900,
//           height: 1.05,
//         );

//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Home'),
//         actions: [
//           IconButton(
//             onPressed: () => context.go('/admin'),
//             icon: const Icon(Icons.admin_panel_settings),
//             tooltip: 'Admin',
//           ),
//         ],
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(18),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text('IPI Smart Parking', style: titleStyle),
//             const SizedBox(height: 18),
//             Expanded(
//               child: GridView.count(
//                 crossAxisCount: 2,
//                 mainAxisSpacing: 12,
//                 crossAxisSpacing: 12,
//                 children: const [
//                   _HomeCard(icon: Icons.timer, title: 'Active parking', route: '/active-session'),
//                   _HomeCard(icon: Icons.local_parking, title: 'IPI parking lots', route: '/parking-lots'),
//                   _HomeCard(icon: Icons.map, title: 'GPS', route: '/gps'),
//                   _HomeCard(icon: Icons.payment, title: 'Payments', route: '/payments'),
//                   _HomeCard(icon: Icons.history, title: 'History', route: '/history'),
//                   _HomeCard(icon: Icons.video_library, title: 'Media', route: '/media'),
//                   _HomeCard(icon: Icons.support_agent, title: 'Contact', route: '/contact'),
//                   _HomeCard(icon: Icons.info_outline, title: 'About', route: '/about'),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class _HomeCard extends StatelessWidget {
//   final IconData icon;
//   final String title;
//   final String route;

//   const _HomeCard({required this.icon, required this.title, required this.route});

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       child: InkWell(
//         borderRadius: BorderRadius.circular(20),
//         // מעבר רק בלחיצה (אין שום מעבר אוטומטי)
//         onTap: () => context.go(route),
//         child: Padding(
//           padding: const EdgeInsets.all(16),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Icon(icon, size: 34, color: AppTheme.yellow),
//               const SizedBox(height: 12),
//               Text(
//                 title,
//                 style: Theme.of(context).textTheme.titleMedium?.copyWith(
//                       fontWeight: FontWeight.w900,
//                     ),
//               ),
//               const Spacer(),

//               // כפתור באמצע/תחתון שממש ברור שלוחצים כדי לעבור
//               SizedBox(
//                 width: double.infinity,
//                 child: ElevatedButton(
//                   onPressed: () => context.go(route),
//                   child: const Text('פתח/י'),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';

// import '../theme/app_theme.dart';
// import '../i18n/strings.dart';
// import '../i18n/language_button.dart';

// class HomeScreen extends StatelessWidget {
//   const HomeScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final titleStyle = Theme.of(context).textTheme.headlineLarge?.copyWith(
//           fontWeight: FontWeight.w900,
//           height: 1.05,
//         );

//     return Scaffold(
//       appBar: AppBar(
//         title: Text(S.t(context, 'home_title')),
//         actions: [
//           const LanguageButton(),
//           IconButton(
//             onPressed: () => context.go('/admin'),
//             icon: const Icon(Icons.admin_panel_settings),
//             tooltip: S.t(context, 'admin'),
//           ),
//         ],
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(18),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(S.t(context, 'ipi_title'), style: titleStyle),
//             const SizedBox(height: 18),
//             Expanded(
//               child: GridView.count(
//                 crossAxisCount: 2,
//                 mainAxisSpacing: 12,
//                 crossAxisSpacing: 12,
//                 children: [
//                   _HomeCard(icon: Icons.timer, title: S.t(context, 'active_parking'), route: '/active-session'),
//                   _HomeCard(icon: Icons.local_parking, title: S.t(context, 'parking_lots'), route: '/parking-lots'),
//                   _HomeCard(icon: Icons.map, title: S.t(context, 'gps'), route: '/gps'),
//                   _HomeCard(icon: Icons.payment, title: S.t(context, 'payments'), route: '/payments'),
//                   _HomeCard(icon: Icons.history, title: S.t(context, 'history'), route: '/history'),
//                   _HomeCard(icon: Icons.video_library, title: S.t(context, 'media'), route: '/media'),
//                   _HomeCard(icon: Icons.support_agent, title: S.t(context, 'contact'), route: '/contact'),
//                   _HomeCard(icon: Icons.info_outline, title: S.t(context, 'about'), route: '/about'),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class _HomeCard extends StatelessWidget {
//   final IconData icon;
//   final String title;
//   final String route;

//   const _HomeCard({required this.icon, required this.title, required this.route});

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       child: InkWell(
//         borderRadius: BorderRadius.circular(20),
//         onTap: () => context.go(route),
//         child: Padding(
//           padding: const EdgeInsets.all(16),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Icon(icon, size: 34, color: AppTheme.yellow),
//               const SizedBox(height: 12),
//               Text(
//                 title,
//                 style: Theme.of(context).textTheme.titleMedium?.copyWith(
//                       fontWeight: FontWeight.w900,
//                     ),
//               ),
//               const Spacer(),
//               SizedBox(
//                 width: double.infinity,
//                 child: ElevatedButton(
//                   onPressed: () => context.go(route),
//                   child: Text(S.t(context, 'open')),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../theme/app_theme.dart';
import '../i18n/strings.dart';
import '../i18n/language_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final titleStyle = Theme.of(context).textTheme.headlineLarge?.copyWith(
          fontWeight: FontWeight.w900,
          height: 1.05,
        );

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => context.go('/begin'),
          icon: const Icon(Icons.arrow_back),
          tooltip: 'Back',
        ),
        title: Text(S.t(context, 'home_title')),
        actions: [
          const LanguageButton(),
          IconButton(
            onPressed: () => context.go('/admin'),
            icon: const Icon(Icons.admin_panel_settings),
            tooltip: S.t(context, 'admin'),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(S.t(context, 'ipi_title'), style: titleStyle),
            const SizedBox(height: 18),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 12,
                crossAxisSpacing: 12,
                children: [
                  _HomeCard(icon: Icons.timer, title: S.t(context, 'active_parking'), route: '/active-session'),
                  _HomeCard(icon: Icons.local_parking, title: S.t(context, 'parking_lots'), route: '/parking-lots'),
                  _HomeCard(icon: Icons.map, title: S.t(context, 'gps'), route: '/gps'),
                  _HomeCard(icon: Icons.payment, title: S.t(context, 'payments'), route: '/payments'),
                  _HomeCard(icon: Icons.history, title: S.t(context, 'history'), route: '/history'),
                  _HomeCard(icon: Icons.video_library, title: S.t(context, 'media'), route: '/media'),
                  _HomeCard(icon: Icons.support_agent, title: S.t(context, 'contact'), route: '/contact'),
                  _HomeCard(icon: Icons.info_outline, title: S.t(context, 'about'), route: '/about'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _HomeCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String route;

  const _HomeCard({required this.icon, required this.title, required this.route});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        onTap: () => context.go(route),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(icon, size: 34, color: AppTheme.yellow),
              const SizedBox(height: 12),
              Text(
                title,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w900,
                    ),
              ),
              const Spacer(),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => context.go(route),
                  child: Text(S.t(context, 'open')),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}