import 'package:flutter/material.dart';

class NoDataSection extends StatelessWidget {
  final String? message;
  const NoDataSection({Key? key, this.message}) : super(key: key);

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
            "assets/images/no_data.png",
            width: MediaQuery.of(context).size.width * 0.5,
          ),
          const SizedBox(height: 15,),
          Text(message ?? "Data not found")
        ],
      ),
    );
  }
}
