import 'package:clean_architecture/domain/blocs/post/post_bloc.dart';
import 'package:clean_architecture/domain/blocs/user/user_bloc.dart';
import 'package:clean_architecture/ui/pages/users/users_page.dart';
import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injector/injector.dart';
import 'package:clean_architecture/dependency_injection/bloc_register.dart';
import 'package:clean_architecture/ui/pages/posts/posts_page.dart';

class MainRouter {
  static FluroRouter defineRoutes() {
    BlocRegister();
    return FluroRouter.appRouter
      ..define(
        '/',
        handler: Handler(
          handlerFunc:
              (BuildContext? context, Map<String, List<String>> params) {
            if (params.containsKey('user_id')) {
              final String? userId = params['user_id']?[0];
              return BlocProvider.value(
                value: Injector.appInstance.get<UserBloc>(),
                child: UsersPage(
                  userId: userId,
                ),
              );
            }
            return BlocProvider.value(
              value: Injector.appInstance.get<UserBloc>(),
              child: const UsersPage(),
            );
          },
        ),
      )
      ..define(
        'posts',
        handler: Handler(
          handlerFunc:
              (BuildContext? context, Map<String, List<String>> params) {
            if (params.containsKey('user_id')) {
              final String? userId = params['user_id']?[0];
              return BlocProvider.value(
                value: Injector.appInstance.get<UserBloc>(),
                child: BlocProvider.value(
                  value: Injector.appInstance.get<PostBloc>(),
                  child: PostsPage(
                    userId: userId,
                  ),
                ),
              );
            }
            return BlocProvider.value(
              value: Injector.appInstance.get<UserBloc>(),
              child: BlocProvider.value(
                value: Injector.appInstance.get<PostBloc>(),
                child: PostsPage(),
              ),
            );
          },
        ),
      )
      ..define(
        'users',
        handler: Handler(
          handlerFunc:
              (BuildContext? context, Map<String, List<String>> params) {
            if (params.containsKey('user_id')) {
              final String? userId = params['user_id']?[0];
              return BlocProvider.value(
                value: Injector.appInstance.get<UserBloc>(),
                child: UsersPage(
                  userId: userId,
                ),
              );
            }
            return BlocProvider.value(
              value: Injector.appInstance.get<UserBloc>(),
              child: const UsersPage(),
            );
          },
        ),
      );
  }
}
