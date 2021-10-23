import 'package:flutter/cupertino.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter/material.dart';

enum SlideAction { delete }

class SlideableWidget<T> extends StatelessWidget {
  final Widget child;
  final Function(SlideAction action) onSlideAction;

  const SlideableWidget(
      {Key? key, required this.child, required this.onSlideAction})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Slidable(
      actionPane: const SlidableDrawerActionPane(),
      actionExtentRatio: 0.25,
      child: child,
      actions: [
        IconSlideAction(
            caption: 'Delete',
            color: Colors.blue,
            icon: Icons.delete,
            onTap: () => {onSlideAction(SlideAction.delete)}),
      ],
      secondaryActions: [
        IconSlideAction(
            caption: 'Delete',
            color: Colors.blue,
            icon: Icons.delete,
            onTap: () => {onSlideAction(SlideAction.delete)}),
      ],
    );
  }
}
