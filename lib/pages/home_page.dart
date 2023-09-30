import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
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
          ButtonWidget(
            title: "Testar authenticação",
            onTap: () async {
              await getIt<FlutterSecureStorage>().write(key: "refreshToken", value: "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6ImFkbSIsInN1YiI6eyJ1c2VybmFtZSI6ImFkbSJ9LCJpYXQiOjE2OTYwMjYzMjUsImV4cCI6MTY5NjYzMTEyNX0.mqWvLNyw1is3lujQex2y5wxjdD4GbTgPn1zxxfX9aBg");
              var res = await apiHelper.api.get("/offer");
              print(res);
            } 
          ),
          Observer(builder: (_) {
            return ListWidget(
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
            );
          })
        ],
      ),
    );
  }
}
