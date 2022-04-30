import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class CachedAvatarImage extends StatelessWidget {
  final double radius;
  final String? avatar;
  const CachedAvatarImage({Key? key, required this.avatar, required this.radius}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: avatar!,
      imageBuilder: (context, imageProvider) {
        return CircleAvatar(
          radius: radius,
          backgroundImage: imageProvider,
        );
      },
      placeholder: (context, url) {
        return CircleAvatar(
          radius: radius,
          child: LoadingAnimationWidget.inkDrop(
            size: radius / 2, color: Colors.blue,
          ),
        );
      },
      errorWidget: (context, url, error) {
        return CircleAvatar(
          radius: radius,
          backgroundImage: const AssetImage('assets/images/noavatar.jpg'),
        );
      },
    );
  }
}
