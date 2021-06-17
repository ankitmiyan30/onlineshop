import 'package:get/state_manager.dart';
import 'package:onlineshopping/services/remote_services.dart';

class ProductController extends GetxController {
  var isLoading = false.obs;
  var productList = [].obs;
  var favProductsList = [].obs;
  @override
  void onInit() {
    fetchProducts();
    super.onInit();
  }

  void fetchProducts() async {
    try {
      isLoading(true);
      var products = await RemoteServices.fetchProducts();
      if (products != null) {
        productList.value = products;
        sortAsPopularity();
      }
    } finally {
      isLoading(false);
    }
  }

  void sortAsPopularity() async {
    if (productList != null) {
      productList.sort((a, b) {
        var arating = a.rating != null ? a.rating : 3;
        var brating = b.rating != null ? b.rating : 3;
        return -arating.compareTo(brating);
      });
    }
  }

  void favouriteList() async {
    favProductsList.value =
        productList.where((product) => product.isFavorite.value).toList();
  }

  void sortByLowToHigh() async {
    if (productList != null) {
      productList.sort((a, b) {
        var aPrice = double.parse(a.price) ?? 0;
        var bPrice = double.parse(b.price) ?? 0;
        return aPrice.compareTo(bPrice);
      });
    }
  }

  void sortByHighToLow() async {
    if (productList != null) {
      productList.sort((a, b) {
        var aPrice = double.parse(a.price) ?? 0;
        var bPrice = double.parse(b.price) ?? 0;
        return -aPrice.compareTo(bPrice);
      });
    }
  }
}
