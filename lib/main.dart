import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skeletons/skeletons.dart';
import 'ui/top_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  runApp(
    const ProviderScope(child: MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SkeletonTheme(
        // themeMode: ThemeMode.light,
        shimmerGradient: LinearGradient(
          colors: [
            Color(0xFFD8E3E7),
            Color(0xFFC8D5DA),
            Color(0xFFD8E3E7),
          ],
          stops: [
            0.1,
            0.5,
            0.9,
          ],
        ),
        darkShimmerGradient: LinearGradient(
          colors: [
            Color(0xFF222222),
            Color(0xFF242424),
            Color(0xFF2B2B2B),
            Color(0xFF242424),
            Color(0xFF222222),
          ],
          stops: [
            0.0,
            0.2,
            0.5,
            0.8,
            1,
          ],
          begin: Alignment(-2.4, -0.2),
          end: Alignment(2.4, 0.2),
          tileMode: TileMode.clamp,
        ),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Chatアプリ',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          darkTheme: ThemeData.dark(),
          home: const TopPage(),
        ));
  }
}
