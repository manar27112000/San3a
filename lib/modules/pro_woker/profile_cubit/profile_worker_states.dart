
import 'package:san3a/models/profileModel.dart';

abstract class ProfileWorkerState {}

class ProfileWorkerInitialState extends ProfileWorkerState{}

class GetProfilePostWorkerLoadingState extends ProfileWorkerState{}
class GetProfilePostWorkerSuccessState extends ProfileWorkerState{
  ProfileModel? getProfile;
  GetProfilePostWorkerSuccessState(this.getProfile);
}
class GetProfilePostWorkerErrorState extends ProfileWorkerState {
  final String error;

  GetProfilePostWorkerErrorState(this.error);
}