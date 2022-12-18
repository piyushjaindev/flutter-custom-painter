import 'dart:async';

import 'package:bloc/bloc.dart';

class CurrentTimeCubit extends Cubit<String> {
  CurrentTimeCubit() : super('') {
    var time = DateTime.now();
    emit('${time.hour}:${time.minute}');

    Future.delayed(Duration(seconds: 60 - time.second), () {
      var time = DateTime.now();
      emit('${time.hour}:${time.minute}');
      _timer = Timer.periodic(const Duration(minutes: 1), (timer) {
        var time = DateTime.now();
        emit('${time.hour}:${time.minute}');
      });
    });

    _timer = Timer.periodic(const Duration(minutes: 1), (timer) {
      var time = DateTime.now();
      emit('${time.hour}:${time.minute}');
    });
  }

  Timer? _timer;

  @override
  Future<void> close() {
    _timer?.cancel();
    return super.close();
  }
}
