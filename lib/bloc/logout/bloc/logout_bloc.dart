import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_siakad/data/datasource/auth_remote_datasource.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'logout_event.dart';
part 'logout_state.dart';
part 'logout_bloc.freezed.dart';

class LogoutBloc extends Bloc<LogoutEvent, LogoutState> {
  LogoutBloc() : super(const _Initial()) {
    on<LogoutEvent>((event, emit) async {
      emit(const _Loading());
      final response = await AuthRemoteDatasource().logout();
      response.fold(
        (error) => emit(const _Error()),
        (data) => emit(const _Loaded()),
      );
    });
  }
}
