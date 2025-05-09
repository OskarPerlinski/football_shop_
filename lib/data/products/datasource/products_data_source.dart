import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';
import 'package:r_gol/data/products/dto/products_model_dto.dart';

@singleton
class ProductsDataSource {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<ProductsModelDto>> getNewProducts() async {
    try {
      final snapshot =
          await _firestore
              .collection('products')
              .orderBy('createdAt', descending: true)
              .limit(10)
              .get();

      return snapshot.docs
          .map((doc) => ProductsModelDto.fromJson(doc.data()))
          .toList();
    } catch (e) {
      throw Exception('Failed to load products.');
    }
  }

  Future<List<ProductsModelDto>> getTopSellings() async {
    try {
      final snapshot =
          await _firestore
              .collection('products')
              .orderBy('totalSold', descending: true)
              .get();

      return snapshot.docs
          .map((doc) => ProductsModelDto.fromJson(doc.data()))
          .toList();
    } catch (e) {
      throw Exception('Failed to load products');
    }
  }
}
