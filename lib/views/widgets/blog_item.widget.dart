import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:testing/models/blog.model.dart';
import 'package:testing/views/widgets/cached_url_image.widget.dart';
import 'package:testing/views/widgets/list_badge.widget.dart';

import 'cached_avatar_image.widget.dart';

class BlogItem extends StatelessWidget {
  final BlogModel item;
  final VoidCallback? onPressed;
  const BlogItem(this.item, {Key? key, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: onPressed,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Stack(
              children: [
                CachedUrlImage(
                  url: item.photo,
                  width: double.infinity,
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(5), topRight: Radius.circular(5)),
                  height: MediaQuery.of(context).size.width * 0.5,
                ),
                Positioned(
                    bottom: 10,
                    right: 10,
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                      decoration: BoxDecoration(
                          color: Colors.black54,
                          borderRadius: BorderRadius.circular(20)),
                      child: Text(
                        item.author ?? "-",
                        style: Theme.of(context)
                            .textTheme
                            .subtitle2!
                            .copyWith(color: Colors.white),
                      ),
                    ))
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(item.title ?? "-",
                      style: Theme.of(context).textTheme.labelLarge),
                  const SizedBox(
                    height: 4,
                  ),
                  Text(
                    item.subTitle ?? "",
                    style: Theme.of(context).textTheme.caption,
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  ListBadge(data: item.tag == null ? [] : item.tag!.split(", "))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
