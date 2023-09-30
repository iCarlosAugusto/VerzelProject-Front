import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shimmer/shimmer.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:verzel_project/components/appbar_widget.dart';
import 'package:verzel_project/components/button_widget.dart';
import 'package:verzel_project/components/card_offer_widget.dart';
import 'package:verzel_project/components/layout_widget.dart';
import 'package:verzel_project/components/list_widget.dart';
import 'package:verzel_project/components/text_widget.dart';
import 'package:verzel_project/components/textfield_widget.dart';
import 'package:verzel_project/main.dart';
import 'package:verzel_project/pages/home_controller.dart';
import 'package:verzel_project/pages/offer_details_page.dart';
import 'package:verzel_project/utils/api.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController controller = HomeController();
    ApiHelper apiHelper = ApiHelper();

    return LayoutWidget(
      scrollController: controller.scrollController,
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
          Observer(builder: (_) {
            return Skeletonizer(
              enabled: true,
              child: ListWidget(
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 5,
                isLoadingMore: controller.isLoading,
                itemBuilder: (_, index) => InkWell(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const OfferDetailsPage(),
                        ),
                      );
                    },
                    child: const CardOfferWidget()),
              ),
            );
          })
        ],
      ),
    );
  }
}
