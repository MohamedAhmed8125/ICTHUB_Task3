import 'package:flutter/material.dart';
import 'package:untitled8/data/models/product_model.dart';

class ProductScreen extends StatelessWidget {
  final ProductData product;
  const ProductScreen({super.key,required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.network(
              product.image,
            height: 300,
          ),
          Text(
            product.detail,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 30,
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          Container(
            width: 200,
            height: 50,
            padding: const EdgeInsetsDirectional.only(
              top: 7,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: Colors.teal,
            ),
            child: Text(
              '${product.price.toString()} EGP',
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 30,
                color: Colors.white
              ),
            ),
          )
        ],
      ),
    );
  }
}
