import 'package:flutter/material.dart';
import 'package:verzel_project/components/appbar_widget.dart';
import 'package:verzel_project/components/card_offer_widget.dart';
import 'package:verzel_project/components/layout_widget.dart';
import 'package:verzel_project/components/list_widget.dart';
import 'package:verzel_project/components/text_widget.dart';
import 'package:verzel_project/components/textfield_widget.dart';
import 'package:verzel_project/pages/offer_details_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return LayoutWidget(
      appBar: AppbarWidget(
        showLogo: true,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextfieldWidget(
            suffixIcon: const Icon(Icons.search),
            hintText: "Busque por marca, modelo, ano, cor...",
          ),
          
          TextWidget(
            "2.159 Resultados",
            customWeight: FontWeight.w600,
            color: Colors.grey[600],
            customFontsize: 14,
            margin: const EdgeInsets.only(top: 16, bottom: 16),
          ),

          ListWidget(
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 20,
            itemBuilder: (_, index) =>  InkWell(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const OfferDetailsPage(),
                  ),
                );
              },
              child: const CardOfferWidget()
            ),
          )
        ],
      ),
    );
  }
}