import 'package:apex3/layout/cubit/states.dart';
import 'package:apex3/models/articale_model.dart';
import 'package:apex3/shared/components/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:video_player/video_player.dart';

class ApexCubit extends Cubit<ApexStates> {
  ApexCubit() : super(ApexInitialState());

  static ApexCubit get(context) => BlocProvider.of(context);

late ArticaleModel articaleModel;
  void changeUrl({
  required String url,
}) {

     controller.dispose();
     articaleModel.url = url;
     controller = VideoPlayerController.network(url)
       ..addListener(() => (){})
       ..setLooping(true)
       ..initialize().then((value){
         controller.play();
         emit(ApexChangeUrlState());
       }).catchError((error){
         error.toString();
       });
  }
}