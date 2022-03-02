import 'package:flutter/material.dart';
import 'package:shop_app/components/product_card.dart';
import 'package:shop_app/models/Product.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../models/Product.dart';
import '../../../size_config.dart';
import 'section_title.dart';

class PopularProducts extends StatelessWidget {
  Future<List<Product>> getProducts() async {
    List<Product> products = [];
    try {
      FirebaseFirestore firestore = FirebaseFirestore.instance;
      var fireVar = await firestore.collection("face-mask").get();
      for (var item in fireVar.docs) {
        products.add(Product(
          colors: [Colors.red],
          description: item.data()['description'],
          images: [item.data()['imageUrl']],
          id: item.data()['id'],
          title: item.data()['name'],
          price: item.data()['price'],
          isFavourite: false,
          isPopular: true,
          rating: 4.7,
        ));
      }
      print("Length of data: ${fireVar.docs.length}");
    } catch (e) {
      print(e);
    }
    return products;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: SectionTitle(title: "Popular Products", press: () {}),
        ),
        SizedBox(height: getProportionateScreenWidth(20)),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: FutureBuilder<List<Product>>(
              future: getProducts(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  if (snapshot.hasData) {
                    List<Product> products = snapshot.data;
                    return Row(
                      children: [
                        ...List.generate(
                          demoProducts.length,
                          (index) {
                            if (demoProducts[index].isPopular)
                              return ProductCard(product: demoProducts[index]);

                            return SizedBox
                                .shrink(); // here by default width and height is 0
                          },
                        ),
                        SizedBox(width: getProportionateScreenWidth(20)),
                      ],
                    );
                  } else {
                    return Center(
                      child: Text("No Products"),
                    );
                  }
                }
              }),
        )
      ],
    );
  }
}
