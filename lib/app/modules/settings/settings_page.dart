import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings Page'),
        backgroundColor: Colors.blueGrey[700],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Settings Page'),
          Center(
            child: ElevatedButton(
                onPressed: () => Navigator.of(context).pushNamed('/settings'),
                child:
                    const Text('Ir para proxima, neste caso outra "Settings"')),
          )
        ],
      ),
    );
  }
}
