import 'package:flutter/material.dart';
import 'package:proyecto_ubb/pages/wrapper.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const Wrapper(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(
            brightness: Brightness.light,
            seedColor: const Color(0xff4793AF),
          ),
          pageTransitionsTheme: const PageTransitionsTheme(builders: {
            TargetPlatform.android: ZoomPageTransitionsBuilder(
              allowEnterRouteSnapshotting: false,
            )
          })),
    );
  }
}
