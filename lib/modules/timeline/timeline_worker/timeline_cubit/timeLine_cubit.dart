import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:san3a/models/WorkerSendUserModel.dart';
import 'package:san3a/models/login_model.dart';
import 'package:san3a/models/post_model.dart';
import 'package:san3a/models/profileModel.dart';
import 'package:san3a/modules/timeline/timeline_worker/timeline_cubit/timeLine_states.dart';
import 'package:san3a/shared/network/End_Points.dart';
import 'package:san3a/shared/network/remote/dio_helper.dart';

class TineLineCubit extends Cubit<TimeLineState> {
  TineLineCubit() : super(InitialPostState());

  static TineLineCubit get(context) => BlocProvider.of(context);
  PostModel? getPost;
  WorkerSendUser? getProfileSender;

  void GetPosts({required String token}) {
    emit(GetPostLoadingState());

    DioHelper.getData(url: GETPOSTS, token: token).then((value) {
      getPost = PostModel.fromJson(value.data);

      emit(GetPostSuccessState(getPost));
    }).catchError((error) {
      emit(GetPostErrorState(error.toString()));
    });
  }

  void goToProfilePerson(index) {
    emit(GoToProfilePersonLoadingState());
    DioHelper.postData(
        url: GOTOPROFILEPERSON,
        data: {"usId": getPost!.postData[index].userDataPost.id})
        .then((value) {
      getProfileSender= WorkerSendUser.fromJson(value.data);
      emit(GoToProfilePersonSuccessState(getProfileSender));
    })
        .catchError((error) {
      emit(GoToProfilePersonErrorState(error.toString()));
    });
  }
}
