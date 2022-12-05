import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'gr_event.dart';
part 'gr_state.dart';

class GrBloc extends Bloc<GrEvent, GrState> {
  GrBloc() : super(GrInitial()) {
    on<GrEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
