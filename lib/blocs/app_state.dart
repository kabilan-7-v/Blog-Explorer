import 'package:blog_explorer/models/blogdetails.dart';
import 'package:equatable/equatable.dart';

abstract class UserState extends Equatable {}

class UserLoadingState extends UserState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class UserLoadedState extends UserState {
  final List<UserModel> user;

  UserLoadedState({required this.user});

  @override
  // TODO: implement props
  List<Object?> get props => [user];
}

class UserErrorstate extends UserState {
  final String error;

  UserErrorstate({required this.error});

  @override
  // TODO: implement props
  List<Object?> get props => [error];
}
