import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:test_cats_app/data/hive/hive.dart';
import 'package:test_cats_app/data/models/cat_fact_model.dart';
import 'package:test_cats_app/data/repository.dart';

part 'cats_event.dart';
part 'cats_state.dart';
part 'cats_bloc.freezed.dart';

class CatsBloc extends Bloc<CatsEvent, CatsState> {
  final Repository _repository;

  CatsBloc(repository)
      : _repository = repository,
        super(const _Initial()) {
    on<_GetCatData>(getCatDataHandler);
  }

  Future<void> getCatDataHandler(
    CatsEvent event,
    Emitter<CatsState> emit,
  ) async {
    try {
      emit(const CatsState.loading());

      late final List<int> catImageResult;
      late final CatFactModel catFactResult;

      {
        final result = await _repository.getRandomCatImage();
        final resultData = result.data as List<int>;
        catImageResult = resultData;
      }

      {
        final result = await _repository.getRandomCatFact();
        final resultData = result.data as List<int>;
        final decodedMap = json.decode(utf8.decode(resultData));

        final model = CatFactModel.fromMap(decodedMap);
        catFactResult = model;

        await hiveCatFactsBox.add(model.toMap());
      }

      emit(CatsState.loaded(
        catImageBytes: catImageResult,
        catFact: catFactResult,
      ));
    } catch (e) {
      emit(const CatsState.error());
    }
  }
}
