import 'package:flutter/material.dart';

class ListWithFixedButtonAtBottom extends StatelessWidget {
  final List<Widget> children;
  final List<Widget> fixedAtBottomChild;
  final Widget? columnWidgetForfixedButton;
  const ListWithFixedButtonAtBottom({
    Key? key,
    required this.children,
    required this.fixedAtBottomChild,
    this.columnWidgetForfixedButton,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: BouncingScrollPhysics(),
      slivers: <Widget>[
        SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: children,
          ),
        ),
        SliverFillRemaining(
          hasScrollBody: false,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              columnWidgetForfixedButton ?? Container(),
              Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: fixedAtBottomChild),
            ],
          ),
        )
      ],
    );
  }
}
