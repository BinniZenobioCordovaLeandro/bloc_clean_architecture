import 'package:clean_architecture/domain/blocs/user/user_bloc.dart';
import 'package:clean_architecture/ui/main_router.dart';
import 'package:clean_architecture/ui/pages/users/users_page.dart';
import 'package:clean_architecture/ui/themes/dark_theme.dart';
import 'package:clean_architecture/ui/themes/light_theme.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injector/injector.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  MainRouter.defineRoutes();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: LightTheme().get(),
      darkTheme: DarkTheme().get(),
      home: BlocProvider.value(
        value: Injector.appInstance.get<UserBloc>(),
        child: const UsersPage(),
      ),
      onGenerateRoute: (RouteSettings settings) {
        return FluroRouter.appRouter
            .matchRoute(
              context,
              settings.name,
              routeSettings: settings,
            )
            .route;
      },
    );
  }
}
