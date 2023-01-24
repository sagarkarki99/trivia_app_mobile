import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'connected_users_state.dart';
part 'connected_users_cubit.freezed.dart';

class ConnectedUsersCubit extends Cubit<ConnectedUsersState> {
  ConnectedUsersCubit() : super(ConnectedUsersState.initial());
}
