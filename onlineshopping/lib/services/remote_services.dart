import 'package:http/http.dart' as http;
import 'package:onlineshopping/main_common.dart';
import 'package:onlineshopping/models/product.dart';

class RemoteServices {
  static var client = http.Client();

  static Future<List<Product>> fetchProducts() async {
    var response = await client
        .get(
          Uri.parse(baseURL + '?brand=maybelline'),
        )
        .timeout(Duration(seconds: 30));

    if (response.statusCode == 200) {
      var jsonString = response.body;
      return productFromJson(jsonString);
    } else {
      //show error message
      return null;
    }
  }
}
