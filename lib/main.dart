import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stream_flutter/ui/app_router.dart';
import 'package:stream_flutter/view_models/counter_view_model.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => CounterViewModel()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: RoutName.home,
      onGenerateRoute: AppRoutes.generateRoute,
      title: 'Stream',
    );
  }
}
