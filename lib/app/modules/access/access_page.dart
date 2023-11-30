import 'package:flutter/material.dart';

class AccessPage extends StatelessWidget {
  const AccessPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Access Page'),
        backgroundColor: Colors.blueGrey[600],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Access Page'),
          Center(
            child: ElevatedButton(
                onPressed: () => Navigator.of(context).pushNamed('/access'),
                child:
                    const Text('Ir para proxima, neste caso outra "Access"')),
          )
        ],
      ),
    );
  }
}
