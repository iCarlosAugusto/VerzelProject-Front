import 'package:flutter/material.dart';
import 'package:verzel_project/components/appbar_widget.dart';
import 'package:verzel_project/components/layout_widget.dart';
import 'package:verzel_project/components/text_widget.dart';

class OfferDetailsPage extends StatelessWidget {
  const OfferDetailsPage({
    super.key,
    required this.name,
    required this.brand,
    required this.model,
    required this.imageUrl
  });

  final String name;
  final String brand;
  final String model;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return LayoutWidget(
      appBar: AppbarWidget(),
      child: Column(
        children: [
          Container(
            height: 300,
            width: MediaQuery.of(context).size.width,
            color: Colors.purple,
          )
        ],
      )
    );
  }
}