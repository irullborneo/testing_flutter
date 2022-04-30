import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ExpiredWidget extends StatelessWidget {
  final int? datetime;
  final bool minimum;
  const ExpiredWidget({Key? key, required this.datetime, this.minimum = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int diff = -1;
    DateTime now = DateTime.now();
    late DateTime expired;
    if (datetime != null) {
      expired = DateTime.fromMillisecondsSinceEpoch(datetime!);
      diff = expired.difference(now).inMilliseconds;

      diff = expired.difference(now).inMilliseconds;
      if (diff < 0) {
        return Badge(
          padding:  EdgeInsets.all(minimum ? 1 : 4),
          badgeContent: Text(
            datetime == null
                ? "Expired"
                : "Expired",
                // : "expired: ${DateFormat("MM/dd/yyyy").format(expired)}",
            style: Theme.of(context)
                .textTheme
                .caption!
                .copyWith(color: Colors.white, fontSize: minimum ? 10 : 12),
            textAlign: TextAlign.center,
          ),
          toAnimate: false,
          shape: BadgeShape.square,
          badgeColor: Colors.red,
          borderRadius: BorderRadius.circular(8),
        );
      }
    }
    return const SizedBox.shrink();
  }
}
