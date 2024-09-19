import 'package:flutter/material.dart';
import 'package:globosoft_test/model/model.dart';

class ProductDetails extends StatefulWidget {
  final Product product;
  const ProductDetails({super.key, required this.product});

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink,
        title: const Text('Product Details',style: TextStyle(color: Colors.white),),
      ),
      body: SafeArea(child: 
      Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20,),
              Center(
                child:ClipRRect(
          borderRadius: BorderRadius.circular(16.0), // Adjust the radius as per your need
          child: Image.network(
            'https://mansharcart.com/image/' + widget.product.thumb!,
            height: 200,
            width: 200,
            fit: BoxFit.cover,
          ),
        )
              ),
              const SizedBox(height: 30,),
              Text(widget.product.name?? '',style: const TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
               Text(widget.product.price?? '',style: const TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
        const Divider(),
            Text(widget.product.stockStatus?? '',style: const TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
           

        
          ],
        ),
      )
      ),
    );
  }
}