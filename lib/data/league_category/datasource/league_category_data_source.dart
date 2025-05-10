import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';
import 'package:r_gol/data/league_category/dto/league_category_models_dto.dart';

@singleton
class LeagueCategoryDataSource {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<LeagueCategoryModelsDto>> getLeagueCategory() async {
    try {
      final snapshot = await _firestore.collection('league').get();

      return snapshot.docs
          .map((doc) => LeagueCategoryModelsDto.fromJson(doc.data()))
          .toList();
    } catch (e) {
      throw Exception('Failed to load.');
    }
  }
}
