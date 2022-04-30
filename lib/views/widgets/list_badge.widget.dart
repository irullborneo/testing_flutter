import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class ListBadge extends StatelessWidget {
  final List<String> data;
  const ListBadge({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: data.length,
        itemBuilder: (c,i){
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 2),
            child: Badge(
              elevation: 0,
              badgeContent: Text(
                data[i],
                style: Theme.of(context).textTheme.caption!.copyWith(color: Colors.white),
                textAlign: TextAlign.center,
              ),
              toAnimate: false,
              shape: BadgeShape.square,
              badgeColor: Colors.blueAccent,
              borderRadius: BorderRadius.circular(5),
            ),
          );
        },
      ),
    );
  }
}
