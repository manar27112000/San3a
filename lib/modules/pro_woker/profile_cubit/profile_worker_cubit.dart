import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:san3a/models/post_model.dart';
import 'package:san3a/models/profileModel.dart';
import 'package:san3a/modules/pro_woker/profile_cubit/profile_worker_states.dart';
import 'package:san3a/shared/network/End_Points.dart';
import 'package:san3a/shared/network/remote/dio_helper.dart';

class ProfileWorkerCubit extends Cubit<ProfileWorkerState>{

  ProfileWorkerCubit():super(ProfileWorkerInitialState());

 static ProfileWorkerCubit get(context)=> BlocProvider.of(context);

  ProfileModel? getProfile;

  void GetProfilePostsWorker({required String token}) {
    emit(GetProfilePostWorkerLoadingState());

    DioHelper.getData(
        url: GETPROFILEPAGE,
        token: token
    )
        .then((value) {

      getProfile=ProfileModel.fromJson(value.data);


      emit(GetProfilePostWorkerSuccessState(getProfile));
    })
        .catchError((error) {

      emit(GetProfilePostWorkerErrorState(error.toString()));
    });
  }

}