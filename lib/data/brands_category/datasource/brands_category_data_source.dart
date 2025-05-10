import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';
import 'package:r_gol/data/brands_category/dto/brands_category_models_dto.dart';

@singleton
class BrandsCategoryDataSource {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<BrandsCategoryModelsDto>> getBrandsCategory() async {
    try {
      final snapshot = await _firestore.collection('brand').get();
      return snapshot.docs
          .map((doc) => BrandsCategoryModelsDto.fromJson(doc.data()))
          .toList();
    } catch (e) {
      throw Exception("Failed to load.");
    }
  }
}
