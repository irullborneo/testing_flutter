import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:meta/meta.dart';
import 'package:testing/models/blog.model.dart';
import 'package:testing/models/candidate.model.dart';
import 'package:testing/utils/api.repository.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  List<dynamic> result = [];
  HomeBloc() : super(HomeUnitial()) {
    on<GetDefaultData>((event, emit) async {
      bool success = true;
      late String? message;
      if (state is HomeInitial) {
        await EasyLoading.show(
            maskType: EasyLoadingMaskType.black, status: "Loading");
      }

      ResultCandidateModel resultCandidateModel =
          await ApiRepository.candidate();
      result.clear();
      if (resultCandidateModel.status) {
        result.addAll(resultCandidateModel.results ?? []);
      } else {
        message = resultCandidateModel.message;
        success = false;
      }

      ResultBlogModel resultBlogModel = await ApiRepository.blog();
      if (resultBlogModel.status) {
        result.addAll(resultBlogModel.results ?? []);
      } else {
        message = resultBlogModel.message;
        success = false;
      }
      EasyLoading.dismiss();
      if (success) {
        result.shuffle();
        emit(HomeInitial(lists: result));
      } else {
        EasyLoading.showToast(message?? "Error", toastPosition: EasyLoadingToastPosition.bottom);
        emit(HomeErrorInitial(message ?? "Error"));
      }
    });

    on<FilterData>((event, emit) {
      List<dynamic> res = [];
      if (event.value.isNotEmpty) {
        for (var element in result) {
          if (element is CandidateModel) {
            if (element.name!.toLowerCase().contains(event.value.toLowerCase())) {
              res.add(element);
            }
          }

          if (element is BlogModel) {
            if (element.author!.toLowerCase().contains(event.value.toLowerCase()) ||
                element.title!.toLowerCase().contains(event.value.toLowerCase())) {
              res.add(element);
            }
          }
        }
        if(res.isNotEmpty) {
          emit(HomeInitial(lists: res));
        }else{
          emit(HomeNoDataInitial());
        }
      } else {
        emit(SearchInitial());
      }

    }, transformer: restartable());

    on<ClearFilterData>((event, emit) {
      emit(HomeInitial(lists: result));
    });

    on<SetSearchView>((event, emit) {
      emit(SearchInitial());
    });
  }
}
