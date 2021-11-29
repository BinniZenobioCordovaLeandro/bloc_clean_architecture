import 'package:clean_architecture/domain/entities/post_entity.dart';
import 'package:clean_architecture/ui/widgets/card_widget.dart';
import 'package:clean_architecture/ui/widgets/fractionally_sized_box_widget.dart';
import 'package:clean_architecture/ui/widgets/text_widget.dart';
import 'package:clean_architecture/ui/widgets/wrap_widget.dart';
import 'package:flutter/material.dart';

class PostCardWidget extends StatelessWidget {
  final PostEntity? postEntity;

  const PostCardWidget({
    Key? key,
    required this.postEntity,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CardWidget(
      child: FractionallySizedBoxWidget(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: WrapWidget(
            children: [
              Center(
                child: TextWidget(
                  '${postEntity?.title}',
                  style: Theme.of(context).textTheme.subtitle1?.copyWith(
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline,
                        fontStyle: FontStyle.italic,
                      ),
                ),
              ),
              TextWidget(
                '${postEntity?.body}',
                style: Theme.of(context).textTheme.bodyText2?.copyWith(
                      decorationStyle: TextDecorationStyle.wavy,
                      fontStyle: FontStyle.italic,
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
