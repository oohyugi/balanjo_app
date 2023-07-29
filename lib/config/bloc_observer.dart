import 'package:flutter_bloc/flutter_bloc.dart';

import '../src/utils/log.dart';

class BBlocObserve extends BlocObserver {
  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    logDebug(tag:'Bloc Transition :', message:transition);
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    logDebug(tag:'Bloc change :', message: change);
  }
}
