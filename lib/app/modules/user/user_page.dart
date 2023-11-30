import 'package:flutter/material.dart';

class UserPage extends StatelessWidget {
  const UserPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Page'),
        backgroundColor: Colors.blueGrey[900],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('User Page'),
          Center(
            child: ElevatedButton(
              onPressed: () => Navigator.of(context).pushNamed('/'),
              child: const Text(
                'Ir para proxima, neste caso outra "Login"',
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Center(
            child: ElevatedButton(
              onPressed: () => showModalBottomSheet(
                context: context,
                builder: (context) => const SizedBox(
                  width: 300,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        'BottomSheet Interno',
                      ),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
              ),
              child: const Text('BottomSheet interno'),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Center(
            child: ElevatedButton(
              onPressed: () => showModalBottomSheet(
                context: context,
                builder: (context) => const SizedBox(
                  width: 300,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        'BottomSheet Externo',
                      ),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
                useRootNavigator: true,
              ),
              child: const Text('BottomSheet externo'),
            ),
          )
        ],
      ),
    );
  }
}
