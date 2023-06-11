import 'package:san3a/models/WorkerSendUserModel.dart';
import 'package:san3a/models/post_model.dart';
import 'package:san3a/models/profileModel.dart';

abstract class TimeLineState{}

class InitialPostState extends TimeLineState{}

class GetPostLoadingState extends TimeLineState{}
class GetPostSuccessState extends TimeLineState{
  PostModel? getPost;
  GetPostSuccessState(this.getPost);
}
class GetPostErrorState extends TimeLineState{
  final String error;
  GetPostErrorState(this.error);
}

class GoToProfilePersonLoadingState extends TimeLineState{}
class GoToProfilePersonSuccessState extends TimeLineState{
  WorkerSendUser? getProfileSender;
  GoToProfilePersonSuccessState(this.getProfileSender);
}
class GoToProfilePersonErrorState extends TimeLineState{
  final String error;
  GoToProfilePersonErrorState(this.error);
}



