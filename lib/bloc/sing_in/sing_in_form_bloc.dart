import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'sing_in_form_event.dart';

part 'sing_in_form_state.dart';

class SingInFormBloc extends Bloc<SingInFormEvent, SingInFormState> {
  SingInFormBloc() : super(SingInFormState()) {
    on<SingInFormEvent>((event, emit) {
      if (event is ObscureCheckChanged) {
        emit(state.copyWith(isObscure: event.isChek));
      }
      if (event is PasswordChanged) {
        emit(state.copyWith(password: event.password));
      }
    });
  }
}
