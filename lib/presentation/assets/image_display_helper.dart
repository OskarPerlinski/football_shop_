import 'package:r_gol/presentation/assets/app_urls.dart';

class ImageDisplayHelper {
   static String generateProductImageURL(String title) {
    return AppUrls.productImage + title + AppUrls.alt;
  }
  static String generateLeagueCategoryImageURL(String title) {
    return AppUrls.leagueImage + title + AppUrls.alt;
  }
  static String generateBrandsCategoryImageURL(String title) {
    return AppUrls.brandsImage + title + AppUrls.alt;
  }
}