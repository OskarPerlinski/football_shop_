import 'package:r_gol/presentation/assets/app_urls.dart';

class ImageDisplayHelper {
   static String generateProductImageURL(String title) {
    return AppUrls.productImage + title + AppUrls.alt;
  }
}