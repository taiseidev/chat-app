import 'package:chatapp/config/config.dart' as config;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../provider/provider.dart';
import 'first_page.dart';

class TopPage extends ConsumerWidget {
  const TopPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _repository = ref.read(firestoreRepository);
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              config.appTitle,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            ElevatedButton(
              onPressed: () async {
                await _repository.fetchGoogleSignIn(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const FirstPage(),
                  ),
                );
              },
              child: const Text(config.loginText),
            ),
          ],
        ),
      ),
    );
  }
}
