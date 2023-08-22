import 'package:balanjo_app/src/features/collections/product_content.dart';
import 'package:balanjo_app/src/shared/component/component.dart';
import 'package:flutter/cupertino.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key, required this.sectionId, required this.title});

  final int sectionId;
  final String title;

  @override
  Widget build(BuildContext context) {
    return BaseLayout(
        title: Text(title),
        body: const ProductsContent(
          id: 1,
        ));
  }
}
