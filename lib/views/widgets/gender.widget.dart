import 'package:flutter/material.dart';

class Gender extends StatelessWidget {
  final String data;
  final double size;
  const Gender(this.data, {Key? key, this.size = 15}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          data == "f" ? Icons.female : Icons.male,
          color: data == "f" ? Colors.pinkAccent : Colors.lightBlue,
          size: size,
        ),
        Text(
          data == "f" ? "Female" :"Male",
          style: Theme.of(context).textTheme.caption!.copyWith(
              color: data == "f" ? Colors.pinkAccent : Colors.lightBlue, fontSize: size),
        )
      ],
    );
  }
}
