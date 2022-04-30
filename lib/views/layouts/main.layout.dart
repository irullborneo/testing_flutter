import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_search_bar/flutter_search_bar.dart';
import 'package:testing/bloc/home/home_bloc.dart';
import 'package:testing/views/pages/home/home.page.dart';
import 'package:testing/views/widgets/error_section.widget.dart';
import 'package:testing/views/widgets/loading_section.widget.dart';
import 'package:testing/views/widgets/nodata_section.widget.dart';
import 'package:testing/views/widgets/search_section.widget.dart';

class MainLayout extends StatefulWidget {
  const MainLayout({Key? key}) : super(key: key);

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final TextEditingController searchController = TextEditingController();
  late SearchBar searchBar;
  @override
  void initState() {
    context.read<HomeBloc>().add(GetDefaultData());
    super.initState();
  }

  _MainLayoutState(){
    searchBar =  SearchBar(
        inBar: false,
        controller: searchController,
        buildDefaultAppBar: buildAppBar,
        setState: setState,
        onChanged: onChanged,
        onCleared: () {
          context.read<HomeBloc>().add(SetSearchView());
        },
        onClosed: () {
          context.read<HomeBloc>().add(ClearFilterData());
        });
  }


  AppBar buildAppBar(BuildContext context) {
    return  AppBar(
        title: const Text('Tech Test'),
        actions: [searchBar.getSearchAction(context)]);
  }

  void onChanged(String value) {
    context.read<HomeBloc>().add(FilterData(value));
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: searchBar.build(context),
      body: BlocConsumer<HomeBloc, HomeState>(
        listener: (context, state) {

          if(state is ErrorSection){}
        },
        builder: (context, state) {
          if (state is HomeInitial) return const HomePage();

          if (state is HomeErrorInitial) {
            return ErrorSection(
              message: state.message,
              onPressed: ()=> context.read<HomeBloc>().add(GetDefaultData()),
            );
          }

          if (state is HomeNoDataInitial) return const NoDataSection();

          if(state is SearchInitial) return const SearchSection();

          return const LoadingSection(
            isPage: true,
          );
        },
      ),
    );
  }
}
