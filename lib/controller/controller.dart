import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:globosoft_test/model/model.dart';
import 'package:globosoft_test/services/api_service.dart';

class ProductController extends GetxController {
  var products = ProductModel().obs; 
  var isLoading = true.obs; 
  var errorMessage = ''.obs; 

  final ApiService apiService;

  ProductController(this.apiService);

  void fetchProduct() async {
    try {
      isLoading(true);
      errorMessage(''); 

      var fetchedProducts = await apiService.fetchProducts();
      products.value = fetchedProducts; 
    } catch (e) {
      errorMessage(e.toString()); 
    } finally {
      isLoading(false); 
    }
  }
  @override
  void onInit() {
   fetchProduct();
    super.onInit();
  }
}
