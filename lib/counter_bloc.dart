import 'package:bloc/bloc.dart';

enum CounterEvent { increment, decrement }


class CounterBloc extends Bloc<CounterEvent, int> {
  @override
  int get initialState => 0;

  @override
  void onTransition(Transition<CounterEvent, int> transition) {
    print("onTransition() has been called..");
    print(transition);
  }

  @override
  Stream<int> mapEventToState(int currentState, CounterEvent event) async* {
    switch (event) {
      case CounterEvent.decrement:
        yield currentState - 1;
        break;
      case CounterEvent.increment:
        print("mapEventToState() called for increment..");
        yield currentState + 1;
        break;
    }
  }
}