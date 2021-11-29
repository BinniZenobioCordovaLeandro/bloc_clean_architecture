import 'package:clean_architecture/domain/entities/user_entity.dart';
import 'package:clean_architecture/ui/widgets/card_widget.dart';
import 'package:clean_architecture/ui/widgets/fractionally_sized_box_widget.dart';
import 'package:clean_architecture/ui/widgets/text_button_widget.dart';
import 'package:clean_architecture/ui/widgets/text_widget.dart';
import 'package:clean_architecture/ui/widgets/wrap_widget.dart';
import 'package:flutter/material.dart';

class UserCardWidget extends StatelessWidget {
  final UserEntity? userEntity;
  final void Function()? onPressed;

  const UserCardWidget({
    Key? key,
    this.userEntity,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CardWidget(
      child: FractionallySizedBoxWidget(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: WrapWidget(
            children: <Widget>[
              SizedBox(
                width: double.infinity,
                child: TextWidget(
                  '${userEntity?.name}',
                  style: Theme.of(context).textTheme.headline6,
                ),
              ),
              Flex(
                direction: Axis.horizontal,
                children: <Widget>[
                  const Icon(
                    Icons.phone,
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  Expanded(
                    child: TextWidget('${userEntity?.phone}'),
                  ),
                ],
              ),
              Flex(
                direction: Axis.horizontal,
                children: <Widget>[
                  const Icon(
                    Icons.email,
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  Expanded(
                    child: TextWidget('${userEntity?.email}'),
                  ),
                ],
              ),
              if (onPressed != null)
                TextButtonWidget(
                  title: 'Ver publicaciones',
                  onPressed: onPressed,
                )
            ],
          ),
        ),
      ),
    );
  }
}
