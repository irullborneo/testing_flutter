import 'package:flutter/material.dart';

class SearchSection extends StatelessWidget {
  const SearchSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: Colors.white),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children:  [
          const Icon(Icons.search),
          const SizedBox(
            height: 5,
          ),
          Text("Search your data", style: Theme.of(context).textTheme.caption)
        ],
      ),
    );
  }
}
