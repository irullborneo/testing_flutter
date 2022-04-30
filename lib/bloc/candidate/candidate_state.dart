part of 'candidate_bloc.dart';

@immutable
abstract class CandidateState {}

class CandidateInitial extends CandidateState {
  final EmailModel? contact;
  final AddressModel? address;
  final ExperienceModel? experience;
  CandidateInitial({required this.experience, required this.address, required this.contact});
}

class CandidateLoadingInitial extends CandidateState {}

class CandidateErrorInitial extends CandidateState {
  final String message;
  CandidateErrorInitial(this.message);
}
