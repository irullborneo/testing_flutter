import 'package:flutter/material.dart';

class DefaultSection extends StatelessWidget {
  final String title;
  final Widget child;
  const DefaultSection({Key? key, required this.title, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      margin: const EdgeInsets.symmetric(vertical: 4),
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(title, style:Theme.of(context).textTheme.titleLarge),
          child
        ],
      ),
    );
  }
}
