// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:flutter_siakad/data/models/request/auth_request_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:flutter_siakad/data/datasource/auth_remote_datasource.dart';
import 'package:flutter_siakad/data/models/response/auth_response_model.dart';

part 'login_bloc.freezed.dart';
part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(const _Initial()) {
    on<_Login>((event, emit) async {
      emit(const _Loading());
      final response = await AuthRemoteDatasource().login(event.requestModel);
      response.fold(
        (error) => emit(_Error(error)),
        (data) => emit(_Loaded(data)),
      );
    });
  }
}
