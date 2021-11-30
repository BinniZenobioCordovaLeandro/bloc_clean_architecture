import 'package:clean_architecture/domain/blocs/post/post_bloc.dart';
import 'package:clean_architecture/domain/blocs/user/user_bloc.dart';
import 'package:clean_architecture/domain/entities/post_entity.dart';
import 'package:clean_architecture/domain/entities/user_entity.dart';
import 'package:clean_architecture/ui/pages/posts/widgets/post_card_widget.dart';
import 'package:clean_architecture/ui/pages/users/widgets/user_card_widget.dart';
import 'package:clean_architecture/ui/widgets/app_bar_widget.dart';
import 'package:clean_architecture/ui/widgets/card_alert_widget.dart';
import 'package:clean_architecture/ui/widgets/fractionally_sized_box_widget.dart';
import 'package:clean_architecture/ui/widgets/safe_area_widget.dart';
import 'package:clean_architecture/ui/widgets/scaffold_widget.dart';
import 'package:clean_architecture/ui/widgets/shimmer_widget.dart';
import 'package:clean_architecture/ui/widgets/single_child_scroll_view_widget.dart';
import 'package:clean_architecture/ui/widgets/text_widget.dart';
import 'package:clean_architecture/ui/widgets/wrap_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostsPage extends StatefulWidget {
  final String? userId;

  const PostsPage({
    Key? key,
    this.userId,
  }) : super(key: key);

  @override
  State<PostsPage> createState() => _PostsPageState();
}

class _PostsPageState extends State<PostsPage> {
  bool show = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldWidget(
      appBar: AppBarWidget(
        title: 'Posts user ${widget.userId}',
        showGoback: true,
        onPressedGoBack: () {
          BlocProvider.of<UserBloc>(context).add(
            const UserEventFetchList(),
          );
          setState(() {
            show = false;
          });
          Navigator.of(context).pop();
        },
      ),
      body: SingleChildScrollViewWidget(
        child: SafeAreaWidget(
          child: WrapWidget(
            children: [
              Container(),
              if (show == true)
                BlocBuilder<UserBloc, UserState>(
                  builder: (context, state) {
                    if (state is UserError) {
                      return Center(
                        child: FractionallySizedBoxWidget(
                            child: CardAlertDangerWidget(
                          title: 'Oh no!',
                          subtitle: state.error,
                        )),
                      );
                    }

                    if (state is UserLoading) {
                      return ShimmerWidget(
                        child: Center(
                          child: FractionallySizedBoxWidget(
                            child: UserCardWidget(
                              userEntity: UserEntity(
                                name: 'Loading',
                                phone: 'Loading',
                                email: 'Loading',
                              ),
                            ),
                          ),
                        ),
                      );
                    }

                    if (state is UserInitial ||
                        state is UserEventFetchList ||
                        state is ListUsersLoaded) {
                      BlocProvider.of<UserBloc>(context).add(
                        UserFetch(
                          userId: int.parse('${widget.userId}'),
                        ),
                      );
                    }

                    if (state is UserLoaded) {
                      return Center(
                        child: FractionallySizedBoxWidget(
                          child: UserCardWidget(
                            userEntity: state.userEntity,
                          ),
                        ),
                      );
                    }
                    return Container();
                  },
                ),
              BlocBuilder<PostBloc, PostState>(
                builder: (context, state) {
                  if (state is PostError) {
                    return Center(
                      child: FractionallySizedBoxWidget(
                          child: CardAlertDangerWidget(
                        title: 'Oh no!',
                        subtitle: state.message,
                      )),
                    );
                  }
                  if (state is PostLoading) {
                    return ShimmerWidget(
                      child: Center(
                        child: FractionallySizedBoxWidget(
                          child: PostCardWidget(
                            postEntity: PostEntity(
                              title: 'Loading',
                              body: 'Loading',
                            ),
                          ),
                        ),
                      ),
                    );
                  }

                  if (state is PostInitial) {
                    BlocProvider.of<PostBloc>(context).add(
                      PostEventFetchListByUserId(
                        userId: int.parse('${widget.userId}'),
                      ),
                    );
                  }
                  if (state is ListPostsLoaded) {
                    return WrapWidget(
                      children: [
                        for (var i = 0; i < state.postEntities!.length; i++)
                          Center(
                            child: FractionallySizedBoxWidget(
                              child: PostCardWidget(
                                postEntity: state.postEntities![i],
                              ),
                            ),
                          ),
                      ],
                    );
                  }
                  return Container();
                },
              ),
              const Center(
                child: TextWidget(
                  'My Hexagonal Clean Architecture in Flutter',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
