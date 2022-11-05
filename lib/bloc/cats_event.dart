part of 'cats_bloc.dart';

@freezed
class CatsEvent with _$CatsEvent {
  const factory CatsEvent.getCatDataEvent() = _GetCatData;
}
