import 'package:bloc/bloc.dart';

part 'juggle_counter_state.dart';

class JuggleCounterCubit extends Cubit<JuggleCounterState> {
  JuggleCounterCubit() : super(const JuggleCounterState());

  void juggleLeft() {
    emit(state.copyWith(leftJuggle: state.leftJuggle + 1));
  }

  void juggleRight() {
    emit(state.copyWith(rightJuggle: state.rightJuggle + 1));
  }
}
