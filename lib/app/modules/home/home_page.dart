import 'package:flutter/material.dart';

import '../access/access_page.dart';
import '../settings/settings_page.dart';
import '../user/user_page.dart';

class HomePage extends StatelessWidget {
  HomePage({
    Key? key,
  }) : super(key: key);

  final navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (can) {
        if (!navigatorKey.currentState!.canPop()) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Tela principal, não pode voltar'),
            ),
          );
        }
      },
      child: NavigatorPopHandler(
        onPop: () {
          if (navigatorKey.currentState!.canPop()) {
            navigatorKey.currentState!.pop();
          }
        },
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Navigator 2.0 - SetState'),
            backgroundColor: Colors.blueGrey,
          ),
          body: Row(
            children: [
              // Aqui unico lugar que precisa da key ... o restante é nagevação pelo Navigator.of(context) normal
              Drawer(
                width: 200,
                child: ListView(
                  children: [
                    const SizedBox(
                      height: kToolbarHeight,
                    ),
                    ListTile(
                      title: const Text('User'),
                      onTap: () {
                        navigatorKey.currentState!.pushNamedAndRemoveUntil(
                          '/',
                          (route) => false,
                        );
                      },
                    ),
                    ListTile(
                      title: const Text('Settings'),
                      onTap: () {
                        navigatorKey.currentState!.pushNamedAndRemoveUntil(
                          '/settings',
                          (route) => false,
                        );
                      },
                    ),
                    ListTile(
                      title: const Text('Access'),
                      onTap: () {
                        navigatorKey.currentState!.pushNamedAndRemoveUntil(
                          '/access',
                          (route) => false,
                        );
                      },
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Navigator(
                  key: navigatorKey,
                  initialRoute: '/',
                  onGenerateRoute: (settings) => generateRoutes(settings),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  MaterialPageRoute? generateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (_) => const UserPage(),
        );
      case '/settings':
        return MaterialPageRoute(
          builder: (_) => const SettingsPage(),
        );
      case '/access':
        return MaterialPageRoute(
          builder: (_) => const AccessPage(),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => const SizedBox.shrink(),
        );
    }
  }
}
