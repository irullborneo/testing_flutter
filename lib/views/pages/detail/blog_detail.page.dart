import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:testing/models/blog.model.dart';
import 'package:testing/views/layouts/detail.layour.dart';
import 'package:testing/views/widgets/cached_url_image.widget.dart';

import '../../../utils/value_const.dart' as value;
import '../../widgets/default_section.widget.dart';
import '../../widgets/list_badge.widget.dart';

class BlogDetail extends StatefulWidget {
  final BlogModel data;
  const BlogDetail(this.data, {Key? key}) : super(key: key);

  @override
  State<BlogDetail> createState() => _BlogDetailState();
}

class _BlogDetailState extends State<BlogDetail>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    _tabController = TabController(vsync: this, length: 2);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DetailLayout(
        showBackIcon: false,
        body: TabBarView(
          controller: _tabController,
          children: <Widget>[_contentSection(), _infoSection()],
        ),
        header: [
          SliverAppBar(
              pinned: true,
              floating: false,
              elevation: 0,
              title: Text(widget.data.title ?? "-"),
              expandedHeight: MediaQuery.of(context).size.height * 0.25,
              flexibleSpace: FlexibleSpaceBar(
                background: CachedUrlImage(
                  url: widget.data.photo,
                  width: double.infinity,
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(5),
                      topRight: Radius.circular(5)),
                  height: MediaQuery.of(context).size.width * 0.5,
                ),
              )),
          SliverPersistentHeader(
            delegate: _SliverAppBarDelegate(
              TabBar(
                indicatorColor: Theme.of(context).primaryColor,
                labelColor: Colors.black87,
                controller: _tabController,
                unselectedLabelColor: Colors.grey,
                tabs: const [
                  Tab(text: "Content"),
                  Tab(text: "Info"),
                ],
              ),
            ),
            pinned: true,
          ),
        ]);
  }

  Widget _contentSection() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 5),
      decoration: const BoxDecoration(color: Colors.white),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            widget.data.content ?? "-",
            style: Theme.of(context).textTheme.bodyText1,
          ),
          const SizedBox(height: 10,),
          ListBadge(
              data: widget.data.tag == null ? [] : widget.data.tag!.split(", "))
        ],
      ),
    );
  }

  Widget _infoSection() {
    late DateTime? birthday;
    if (widget.data.createAt != null) {
      birthday =
          DateTime.fromMillisecondsSinceEpoch(widget.data.createAt! * 1000);
    }

    return DefaultSection(
      title: "Detail",
      child: Column(
        children: [
          ListTile(
            leading: const Icon(Icons.person),
            title: Text(widget.data.author ?? "-"),
            subtitle: const Text("Author"),
          ),
          (birthday == null)
              ? const SizedBox.shrink()
              : ListTile(
                  leading: const Icon(Icons.calendar_today),
                  title: Text(
                    value.shortMonth[birthday.month - 1] +
                        " ${birthday.day}, ${birthday.year}",
                  ),
                )
        ],
      ),
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate(this._tabBar);

  final TabBar _tabBar;

  @override
  double get minExtent => _tabBar.preferredSize.height;
  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      decoration: const BoxDecoration(color: Colors.white),
      child: _tabBar,
    );
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return false;
  }
}
