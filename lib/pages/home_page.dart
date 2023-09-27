import 'package:flutter/material.dart';
import 'package:verzel_project/components/appbar_widget.dart';
import 'package:verzel_project/components/card_offer_widget.dart';
import 'package:verzel_project/components/layout_widget.dart';
import 'package:verzel_project/components/text_widget.dart';
import 'package:verzel_project/components/textfield_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return LayoutWidget(
      child: Column(
        children: [
          const TextWidget("TESTE"),
          Container(
            color: Colors.blue,
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            child: TextfieldWidget(
              suffixIcon: const Icon(Icons.search),
              hintText: "Busque por marca, modelo, ano, cor...",
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(50.0),
            child: GridView.count(
              mainAxisSpacing: 20,
              crossAxisSpacing: 20,
              childAspectRatio: 4/3,
              shrinkWrap: true,
              
              crossAxisCount: 3,
              children: List.generate(100, (index) {
                return const CardOfferWidget();
              }),
            ),
          ),
        ],
      ),
    );
  }
}