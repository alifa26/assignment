
import 'package:assignment/cubits/timer%20cubit/app%20cubit/app_states.dart';
import 'package:assignment/models/question_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppBloc extends Cubit<AppState> {
  AppBloc() : super(Empty());

  static AppBloc get(context) => BlocProvider.of(context);
  
  void getUser ({required String uId
}){
  emit(GetUserLodingErrorState());
FirebaseFirestore.instance.collection('users').doc(uId).get().then((value){
  emit(GetUserLodingSuccState());
}).catchError((error){
  emit(GetUserLodingErrorState());
});
}


List<QuestionModel> questions = []; 
void getQuestions() {
  FirebaseFirestore.instance.collection('questions').get().then((value) {
    value.docs.forEach((element){
      questions.add(QuestionModel.fromJson(element.data()));
    });
    emit(GetQuestionsLodingSuccState());
    }).catchError((error){
      emit(GetQuestionsLodingErrorState());
    });
}


  }