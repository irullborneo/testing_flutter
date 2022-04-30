import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:meta/meta.dart';
import 'package:testing/models/address.model.dart';
import 'package:testing/models/candidate.model.dart';
import 'package:testing/models/email.model.dart';
import 'package:testing/models/experience.model.dart';
import 'package:testing/utils/api.repository.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:testing/utils/value_const.dart' as value;
import 'package:url_launcher/url_launcher.dart';
import 'package:whatsapp_unilink/whatsapp_unilink.dart';

part 'candidate_event.dart';
part 'candidate_state.dart';

class CandidateBloc extends Bloc<CandidateEvent, CandidateState> {
  late CandidateModel candidate;
   EmailModel? email = EmailModel();
   AddressModel? address = AddressModel();
   ExperienceModel? experience = ExperienceModel();

  CandidateBloc() : super(CandidateLoadingInitial()) {
    on<GetAllDetailCandidate>((event, emit) {
      emit(CandidateLoadingInitial());
      candidate = event.data;
      add(GetAddressCandidate());
      add(GetEmailCandidate());
      add(GetExperienceCandidate());
    });

    on<GetAddressCandidate>((event, emit) async {
      ResultAddressModel res = await ApiRepository.address();
      if(res.status){
        address = res.results!.firstWhere((element) => element.id == candidate.id);
        add(SuccessCandidate());
      }else{
        address = null;
        add(SetErrorCandidate(res.message!));
      }
    });

    on<GetEmailCandidate>((event, emit) async {
      ResultEmailModel res = await ApiRepository.email();
      if(res.status){
        email = res.results!.firstWhere((element) => element.id == candidate.id);
        add(SuccessCandidate());
      }else{
        email = null;
        add(SetErrorCandidate(res.message!));
      }
    });

    on<GetExperienceCandidate>((event, emit) async {
      ResultExperienceModel res = await ApiRepository.experience();
      if(res.status){
        experience = res.results!.firstWhere((element) => element.id == candidate.id);
        add(SuccessCandidate());
      }else{
        experience = null;
        add(SetErrorCandidate(res.message!));
      }
    });

    on<SuccessCandidate>((event, emit) {
      emit(CandidateInitial(address: address, experience: experience, contact: email));
    }, transformer: restartable());

    on<SetErrorCandidate>((event, emit) {
      EasyLoading.showToast(event.message, toastPosition: EasyLoadingToastPosition.bottom);
      emit(CandidateErrorInitial(event.message));
    });

    on<WhatsappContact>((event, emit) async {
      if(event.phone!.isNotEmpty){
        await EasyLoading.show(
            maskType: EasyLoadingMaskType.black, status: "Loading");
        final link = WhatsAppUnilink(
          phoneNumber: event.phone!,
          text: "Hi i am MK company",
        );

        await launch('$link');
        EasyLoading.dismiss();
      }
    });

    on<EmailContact>((event, emit) async {
      if(event.email!.isNotEmpty){
        await EasyLoading.show(
            maskType: EasyLoadingMaskType.black, status: "Loading");
        final Email email = Email(
          body: 'Hi i am MK company',
          subject: 'Email subject',
          recipients: [event.email!],

          isHTML: false,
        );

        await FlutterEmailSender.send(email);
        EasyLoading.dismiss();

      }
    });
  }
}
