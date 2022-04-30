import 'package:flutter/material.dart';
import 'package:testing/models/candidate.model.dart';
import 'package:testing/views/widgets/birthday.widget.dart';
import 'package:testing/views/widgets/expired.widget.dart';

import 'cached_avatar_image.widget.dart';
import 'gender.widget.dart';

class CandidateItem extends StatelessWidget {
  final VoidCallback? onPressed;
  final CandidateModel item;
  const CandidateItem(this.item, {Key? key, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {



    return Card(
        child: InkWell(
      onTap: onPressed,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: CachedAvatarImage(
                      avatar: item.photo,
                      radius: MediaQuery.of(context).size.width * 0.1,
                    ),
                  ),
                  Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: ExpiredWidget(
                        datetime: item.expired,
                        minimum: true,
                      ))
                ],
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(item.name ?? "-",
                      style: Theme.of(context).textTheme.labelLarge),
                  const SizedBox(
                    height: 4,
                  ),
                  Row(
                    children: [
                      Gender(item.gender!),
                      const SizedBox(
                        width: 8,
                      ),
                      item.birthday == null
                          ? const SizedBox.shrink()
                          : Birthday(item.birthday!)
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    ));
  }
}
