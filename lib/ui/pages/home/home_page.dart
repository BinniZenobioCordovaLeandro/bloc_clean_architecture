import 'package:clean_architecture/ui/widgets/app_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injector/injector.dart';
import 'package:clean_architecture/ui/main_router.dart';
import 'package:clean_architecture/domain/blocs/auth/auth_bloc.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  void initState() {
    MainRouter.defineRoutes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(
        title: 'Homepage',
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              BlocProvider.value(
                value: Injector.appInstance.get<AuthBloc>(),
                child: Container(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
