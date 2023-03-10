import 'dart:async';

import 'package:assignment/cubits/timer%20cubit/timer_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TimerCubit extends Cubit<TimerStates>{
  TimerCubit() : super(TimerInit());
  Timer? _timer;

  startTime([int? time]){
    if(time != null){
      emit(TimerProgress(time));
    }else{
      emit(TimerProgress(0));
    }
    _timer = Timer.periodic(const Duration(seconds:1), onTick);
  }

  onTick(Timer timer){
    if(state is TimerProgress){
      TimerProgress wip = state as TimerProgress;
      if(wip.elapsed!<60){
        emit(TimerProgress(wip.elapsed!+1));
      }
      else{
        _timer!.cancel();
        emit(const TimerInit());
      }
    }
  }
}