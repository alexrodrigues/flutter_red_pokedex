part of 'details_bloc.dart';

enum Status { initial, loading, success, failure, finished }

class DetailsState extends Equatable {
  const DetailsState({
    this.status = Status.initial,
    this.result,
  });

  DetailsState copyWith({
    Status? status,
    Pokemon? result,
  }) {
    return DetailsState(
      status: status ?? this.status,
      result: result
    );
  }

  DetailsState forceWith({
    Status? status,
    Pokemon? result,
  }) {
    return DetailsState(
      status: status ?? this.status,
      result: result,
    );
  }

  final Status status;
  final Pokemon? result;


  @override
  List<Object> get props => [status, result ?? "error"];
}
