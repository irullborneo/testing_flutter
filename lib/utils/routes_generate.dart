import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:testing/models/blog.model.dart';
import 'package:testing/models/candidate.model.dart';
import 'package:testing/utils/routes_name.dart';
import 'package:testing/views/pages/detail/blog_detail.page.dart';
import 'package:testing/views/pages/detail/candidate_detail.page.dart';
import 'package:testing/views/widgets/error_section.widget.dart';

class RoutesGenerate {
  static const PageTransitionType _defaultType = PageTransitionType.fade;
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.detailBlog:
        return PageTransition(
            child: BlogDetail(settings.arguments as BlogModel),
            type: _defaultType);
      case RoutesName.detailCandidate:
        return PageTransition(
            child: CandidateDetail(settings.arguments as CandidateModel),
            type: _defaultType);
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return const ErrorSection(message: "There is no page");
      ;
    });
  }
}
