import 'package:flutter/material.dart';

class DetailLayout extends StatefulWidget {
  final Widget body;
  final bool showBackIcon;
  final List<Widget> header;
  const DetailLayout({Key? key, required this.body, required this.header, this.showBackIcon = true})
      : super(key: key);

  @override
  State<DetailLayout> createState() => _DetailLayoutState();
}

class _DetailLayoutState extends State<DetailLayout> {
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          NestedScrollView(
            controller: _scrollController,
            floatHeaderSlivers: true,
            headerSliverBuilder: (context, value) {
              return widget.header;
            },
            body: SafeArea(child: widget.body),
          ),
          widget.showBackIcon ? Positioned(
              left: 0,
              top: 10,
              child: SafeArea(
                child: IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(Icons.clear),
                ),
              )) : const SizedBox.shrink()
        ],
      ),
    );
  }
}
