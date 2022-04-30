import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testing/models/candidate.model.dart';
import 'package:testing/utils/routes_name.dart';
import 'package:testing/views/widgets/blog_item.widget.dart';

import '../../../bloc/home/home_bloc.dart';
import '../../widgets/candidate_item.widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return (state is HomeInitial)
            ? ListView.builder(
                itemCount: state.lists.length,
                itemBuilder: (context, index) {
                  return (state.lists[index] is CandidateModel)
                      ? CandidateItem(
                          state.lists[index],
                          onPressed: () => Navigator.pushNamed(
                              context, RoutesName.detailCandidate,
                              arguments: state.lists[index]),
                        )
                      : BlogItem(state.lists[index],
                          onPressed: () => Navigator.pushNamed(
                              context, RoutesName.detailBlog,
                              arguments: state.lists[index]));
                })
            : const SizedBox.shrink();
      },
    );
  }
}
