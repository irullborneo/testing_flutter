part of 'candidate_bloc.dart';

@immutable
abstract class CandidateEvent {}

class GetAllDetailCandidate extends CandidateEvent{
  final CandidateModel data;
  GetAllDetailCandidate(this.data);
}

class GetAddressCandidate extends CandidateEvent{}

class GetEmailCandidate extends CandidateEvent{}

class GetExperienceCandidate extends CandidateEvent{}

class SetErrorCandidate extends CandidateEvent{
  final String message;
  SetErrorCandidate(this.message);
}

class SuccessCandidate extends CandidateEvent{}

class WhatsappContact extends CandidateEvent{
  final String? phone;
  WhatsappContact(this.phone);
}

class EmailContact extends CandidateEvent{
  final String? email;
  EmailContact(this.email);
}