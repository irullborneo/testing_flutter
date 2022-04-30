import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class LoadingSection extends StatelessWidget {
  final bool isPage;
  const LoadingSection({Key? key, this.isPage = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: LoadingAnimationWidget.staggeredDotsWave(
        color: Colors.blue,
        // color: Colors.white,
        size: isPage ? 200 : 20,
      ),
    );
  }
}
