import '../actions/Actions.dart';


int counterReducer(int state, dynamic action) {
  switch (action) {
    case Actions.INCREASE :
      return state + 1;
    case Actions.DECREASE :
      return state - 1;
    default:
      return state;
  }
}


