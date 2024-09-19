import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:globosoft_test/controller/controller.dart';
import 'package:globosoft_test/widget/image_carousel_widget.dart';
import 'package:globosoft_test/widget/product_card.dart';
import 'package:globosoft_test/widget/product_details.dart';
import 'package:globosoft_test/widget/search_field.dart';

import '../../services/api_service.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final ProductController productController =
        Get.put(ProductController(ApiService()));

    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(170.0),
        child: AppBar(
          backgroundColor: Colors.pink,
          automaticallyImplyLeading: false,
          shape: const ContinuousRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(50),
              bottomRight: Radius.circular(50),
            ),
          ),
          flexibleSpace: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Hello John',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'Welcome back!',
                            style: TextStyle(color: Colors.white70),
                          ),
                        ],
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Icon(Icons.menu),
                      ),
                    ],
                  ),
                  SearchField()
                ],
              ),
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 10,
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Specia for you',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              StaticImageCarousel(
                imageUrls: const [
                  'assets/images/fasd.jpeg',
                  'assets/images/fasd.jpeg',
                  'assets/images/fasd.jpeg',
                ],
              ),
              SizedBox(height: 20,),
              Obx(() {
                if (productController.isLoading.value) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }

                if (productController.errorMessage.isNotEmpty) {
                  return Center(
                    child: Text('Error: ${productController.errorMessage}'),
                  );
                }

                if (productController.products.value.products == null ||
                    productController.products.value.products!.isEmpty) {
                  return const Center(child: Text("No products available"));
                }

                // ListView to display products
                return Expanded(
                  child: ListView.builder(
                    itemCount:
                        productController.products.value.products!.length,
                    itemBuilder: (context, index) {
                      var product =
                          productController.products.value.products![index];
                      return GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) =>
                                  ProductDetails(product: product),
                            ));
                          },
                          child: ProductCard(product: product, onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(builder: (context) => ProductDetails(product: product),));
                          },));
                    },
                  ),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
