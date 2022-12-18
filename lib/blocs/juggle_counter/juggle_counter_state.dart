part of 'juggle_counter_cubit.dart';

class JuggleCounterState {
  final int leftJuggle, rightJuggle;

  const JuggleCounterState({this.leftJuggle = 0, this.rightJuggle = 0});

  JuggleCounterState copyWith({
    int? leftJuggle,
    int? rightJuggle,
  }) {
    return JuggleCounterState(
      leftJuggle: leftJuggle ?? this.leftJuggle,
      rightJuggle: rightJuggle ?? this.rightJuggle,
    );
  }
}
