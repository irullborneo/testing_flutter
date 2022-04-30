import 'package:flutter/material.dart';

class ErrorSection extends StatelessWidget {
  final String message;
  final VoidCallback? onPressed;
  final bool isPage;
  const ErrorSection(
      {Key? key, this.onPressed, required this.message, this.isPage = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: Colors.white),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            "assets/images/error.png",
            width: MediaQuery.of(context).size.width * 0.5,
          ),
          const SizedBox(height:15),
          Text(message),
          onPressed == null
              ? const SizedBox.shrink()
              : ElevatedButton.icon(
                  icon: const Icon(Icons.refresh),
                  onPressed: onPressed,
                  label: const Text("Try Again"),
                ),
        ],
      ),
    );
  }
}
