import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../utils/value_const.dart' as value;

class Birthday extends StatelessWidget {
  final int data;
  final double size;
  const Birthday(this.data, {Key? key, this.size = 15}) : super(key: key);

  @override
  Widget build(BuildContext context) {
     DateTime birthday = DateTime.fromMillisecondsSinceEpoch(data);


    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.cake,
          color: Colors.grey,
          size: size,
        ),
        Text(
          value.shortMonth[birthday.month - 1] + " ${birthday.day}, ${birthday.year}",
          style: Theme.of(context).textTheme.caption!.copyWith(fontSize: size),
        )
      ],
    );
  }
}
