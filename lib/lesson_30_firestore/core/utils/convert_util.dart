import 'package:flutter_learning/lesson_30_firestore/features/home/domain/entities/genre.dart';

List<Genre> convertGenreIdsToGenreStrings(
    List<int> listGenreIds, List<Genre> listGenres) {
  return listGenreIds
      .map((eId) => listGenres.firstWhere((value) => eId == value.id))
      .toList();
}
