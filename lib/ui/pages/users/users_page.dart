import 'package:clean_architecture/ui/widgets/elevated_button_widget.dart';
import 'package:clean_architecture/ui/widgets/fractionally_sized_box_widget.dart';
import 'package:clean_architecture/ui/widgets/text_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:clean_architecture/domain/blocs/user/user_bloc.dart';
import 'package:clean_architecture/ui/pages/users/widgets/user_card_widget.dart';
import 'package:clean_architecture/ui/widgets/app_bar_widget.dart';
import 'package:clean_architecture/ui/widgets/scaffold_widget.dart';
import 'package:clean_architecture/ui/widgets/single_child_scroll_view_widget.dart';
import 'package:clean_architecture/ui/widgets/wrap_widget.dart';

class UsersPage extends StatefulWidget {
  final String? userId;

  const UsersPage({
    Key? key,
    this.userId,
  }) : super(key: key);

  @override
  State<UsersPage> createState() => _UsersPageState();
}

class _UsersPageState extends State<UsersPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldWidget(
      appBar: const AppBarWidget(
        title: 'Prueba de ingreso',
      ),
      body: SingleChildScrollViewWidget(
        child: BlocBuilder<UserBloc, UserState>(
          bloc: BlocProvider.of<UserBloc>(context),
          builder: (context, state) {
            if (state is UserInitial) {
              BlocProvider.of<UserBloc>(context).add(
                UserEventFetchList(),
              );
            }

            if (state is UserLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            if (state is ListUsersLoaded &&
                state.listUserEntities?.isNotEmpty == true) {
              return WrapWidget(
                children: [
                  Container(),
                  Center(
                    child: FractionallySizedBoxWidget(
                      child: TextFieldWidget(
                        labelText: 'Buscar usuario',
                        onChanged: (String string) {
                          print(string);
                        },
                      ),
                    ),
                  ),
                  ...state.listUserEntities!.map((user) {
                    return Center(
                      child: FractionallySizedBoxWidget(
                        child: UserCardWidget(
                          userEntity: user,
                          onPressed: () {
                            Navigator.of(context).pushNamed(
                              '/user',
                              arguments: user.id,
                            );
                          },
                        ),
                      ),
                    );
                  }).toList()
                ],
              );
            }

            return Center(
              child: ElevatedButtonWidget(
                  title: 'refresh',
                  onPressed: () {
                    BlocProvider.of<UserBloc>(context).add(
                      UserEventFetchList(),
                    );
                  }),
            );
          },
        ),
      ),
    );
  }
}
