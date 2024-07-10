import 'package:bloc/bloc.dart';

/// `YouseCubit` is a `Cubit` that drains the stream when it's closed
abstract class KalshiCubit<State> extends Cubit<State> {
  /// Provide a [KalshiCubit] instance
  KalshiCubit(super.initialState);

  @override
  void emit(State state) {
    if (!isClosed) {
      super.emit(state);
    }
  }
}
