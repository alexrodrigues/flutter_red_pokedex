part of 'home_bloc.dart';

enum Status { initial, loading, success, failure, finished }

class HomeState extends Equatable {
  const HomeState({
    this.status = Status.initial,
    this.result = const <Pokemon>[],
  });

  HomeState copyWith({
    Status? status,
    List<Pokemon>? result,
  }) {
    return HomeState(
      status: status ?? this.status,
      result: this.result + (result ?? []),
    );
  }

  HomeState forceWith({
    Status? status,
    List<Pokemon>? result,
  }) {
    return HomeState(
      status: status ?? this.status,
      result: result ?? [],
    );
  }

  final Status status;
  final List<Pokemon> result;

  bool get firstPage => result.isEmpty;

  @override
  List<Object> get props => [status, result];
}
