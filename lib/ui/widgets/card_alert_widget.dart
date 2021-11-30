import 'package:clean_architecture/ui/widgets/card_widget.dart';
import 'package:flutter/material.dart';

class CardAlertDangerWidget extends StatelessWidget {
  final String? title;
  final String? subtitle;

  const CardAlertDangerWidget({Key? key, this.title, this.subtitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CardWidget(
      elevation: 0,
      color: const Color(0x33f44336),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: FractionallySizedBox(
          widthFactor: 0.9,
          child: RichText(
            text: TextSpan(
              text: (title != null) ? '$title' : null,
              style: Theme.of(context).textTheme.subtitle2!.copyWith(
                    color: Colors.red,
                  ),
              children: [
                if (subtitle != null)
                  TextSpan(
                    style: Theme.of(context).textTheme.bodyText2,
                    text: subtitle,
                  )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
