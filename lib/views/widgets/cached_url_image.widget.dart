import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CachedUrlImage extends StatelessWidget {
  final BorderRadiusGeometry? borderRadius;
  final String? url;
  final double? width, height;
  final EdgeInsetsGeometry? margin;
  final GestureTapCallback? onPress;
  const CachedUrlImage(
      {Key? key,
      required this.url,
      this.borderRadius,
      this.width,
      this.height,
      this.margin,
      this.onPress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (url != null) {
      return CachedNetworkImage(
        imageUrl: url!,
        imageBuilder: (context, imageProvider) {
          return InkWell(
            onTap: onPress,
            child: Container(
              width: width,
              height: height,
              margin: margin,
              decoration: BoxDecoration(
                  borderRadius: borderRadius,
                  image:
                  DecorationImage(image: imageProvider, fit: BoxFit.cover)),
            ),
          );
        },
        placeholder: (context, url) {
          return Shimmer.fromColors(
            baseColor: Colors.grey[400]!,
            highlightColor: Colors.grey[300]!,
            child: Container(
              width: width, height: height,
              margin: margin,
              decoration: BoxDecoration(
                  borderRadius: borderRadius, color: Colors.grey[300]),
            ),
          );
        },
        errorWidget: (context, url, error) {
          return Container(
            width: width,
            height: height,
            margin: margin,
            decoration: BoxDecoration(
                borderRadius: borderRadius, color: Colors.grey[300]),
          );
        },
      );
    }

    return Container(
      width: width,
      margin: margin,
      height: height,
      decoration:
      BoxDecoration(borderRadius: borderRadius, color: Colors.grey[300]),
    );
  }
}
