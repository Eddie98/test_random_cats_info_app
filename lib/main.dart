import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:test_cats_app/data/dio/rest_client.dart';
import 'package:test_cats_app/data/hive/hive.dart';
import 'package:test_cats_app/routes.dart';

import 'bloc/cats_bloc.dart';
import 'data/data_provider.dart';
import 'data/repository.dart';
import 'data/service/service_locator.dart';
import 'ui/widgets/disable_glow.dart';

Future<void> _initApp() async {
  ServiceLocator().setup();
  await openHiveBox('cat_facts');
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await _initApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<Repository>(
          create: (context) => RepositoryImpl(
            DataProviderImpl(GetIt.I.get<RestClient>()),
          ),
        ),
      ],
      child: Builder(builder: (context) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => CatsBloc(context.read<Repository>()),
            ),
          ],
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            scrollBehavior: DisableGlowScrollBehavior(),
            theme: ThemeData(
              primarySwatch: Colors.blue,
              textTheme: const TextTheme(
                bodyMedium: TextStyle(
                  fontSize: 22.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            initialRoute: Routes.homeLink,
            onGenerateRoute: Routes.onGenerateRoute,
          ),
        );
      }),
    );
  }
}
