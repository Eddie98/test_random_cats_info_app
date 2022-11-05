part of 'cats_bloc.dart';

@freezed
class CatsState with _$CatsState {
  const factory CatsState.initial() = _Initial;
  const factory CatsState.loading() = _Loading;
  const factory CatsState.loaded({
    required List<int> catImageBytes,
    required CatFactModel catFact,
  }) = _Loaded;
  const factory CatsState.error() = _Error;
}
