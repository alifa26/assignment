import 'package:equatable/equatable.dart';

abstract class TimerStates extends Equatable{
  final int? elapsed;
  const TimerStates(this.elapsed);
}
class TimerInit extends TimerStates{
  const TimerInit():super(0);
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class TimerProgress extends TimerStates{
  const TimerProgress(int? elapsed):super(elapsed);
  @override
  // TODO: implement props
  List<Object?> get props => [elapsed];

}