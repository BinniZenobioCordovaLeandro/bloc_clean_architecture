import 'package:clean_architecture/ui/widgets/elevated_button_widget.dart';
import 'package:clean_architecture/ui/widgets/fractionally_sized_box_widget.dart';
import 'package:clean_architecture/ui/widgets/safe_area_widget.dart';
import 'package:clean_architecture/ui/widgets/shimmer_widget.dart';
import 'package:clean_architecture/ui/widgets/svg_or_image_widget.dart';
import 'package:clean_architecture/ui/widgets/text_field_widget.dart';
import 'package:clean_architecture/ui/widgets/text_widget.dart';
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
        child: SafeAreaWidget(
          child: BlocBuilder<UserBloc, UserState>(
              bloc: BlocProvider.of<UserBloc>(context),
              builder: (context, state) {
                if (state is UserInitial || state is UserFetch) {
                  BlocProvider.of<UserBloc>(context).add(
                    const UserEventFetchList(),
                  );
                }
                if (state is UserError) {
                  return WrapWidget(
                    children: [
                      const Center(
                        child: FractionallySizedBoxWidget(
                          child: SvgOrImageWidget(
                            urlSvgOrImage:
                                'https://www.initcoms.com/wp-content/uploads/2020/07/404-error-not-found-1.png',
                          ),
                        ),
                      ),
                      Center(
                        child: FractionallySizedBoxWidget(
                          child: ElevatedButtonWidget(
                            onPressed: () {
                              BlocProvider.of<UserBloc>(context).add(
                                const UserEventFetchList(),
                              );
                            },
                            title: 'Reintentar',
                          ),
                        ),
                      ),
                    ],
                  );
                }

                return ShimmerWidget(
                  enabled: (state is ListUsersLoaded) ? false : true,
                  child: SafeAreaWidget(
                    child: WrapWidget(
                      children: [
                        Container(),
                        Center(
                          child: FractionallySizedBoxWidget(
                            child: TextFieldWidget(
                              labelText: 'Buscar usuario',
                              onChanged: (String string) {
                                BlocProvider.of<UserBloc>(context).add(
                                  UserEventFetchList(userName: string),
                                );
                              },
                            ),
                          ),
                        ),
                        if (state is ListUsersLoaded &&
                            state.listUserEntities!.isEmpty)
                          const Center(
                            child: FractionallySizedBoxWidget(
                              child: TextWidget('List is empty...'),
                            ),
                          ),
                        if (state is ListUsersLoaded)
                          ...state.listUserEntities!.map((user) {
                            return Center(
                              child: FractionallySizedBoxWidget(
                                child: UserCardWidget(
                                  userEntity: user,
                                  onPressed: () {
                                    Navigator.of(context).pushNamed(
                                      '/posts?user_id=${user.id}',
                                    );
                                  },
                                ),
                              ),
                            );
                          }).toList()
                      ],
                    ),
                  ),
                );
              }),
        ),
      ),
    );
  }
}
