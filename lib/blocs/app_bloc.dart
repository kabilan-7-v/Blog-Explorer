import 'package:blog_explorer/blocs/app_events.dart';
import 'package:blog_explorer/blocs/app_state.dart';
import 'package:blog_explorer/server/api.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRespository _userrespository;
  UserBloc(this._userrespository) : super(UserLoadingState()) {
    on<LoadUserEvent>(
      (event, emit) async {
        // emit(UserLoadingState());
        // print("sfdgfhjg");
        try {
          final users = await _userrespository.getuser();
          print("userr sucess");

          emit(UserLoadedState(user: users));
        } catch (e) {
          print("error");
          emit(UserErrorstate(
            error: e.toString(),
          ));
        }
      },
    );
  }
}
