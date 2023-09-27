import 'package:flutter/material.dart';
import 'package:verzel_project/components/text_widget.dart';

class CardOfferWidget extends StatelessWidget {
  const CardOfferWidget({super.key});

  @override
  Widget build(BuildContext context) {
    //final imageUrl = "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse4.mm.bing.net%2Fth%3Fid%3DOIP.NDOdMC_KsCMy-cpI6kRK5wHaEW%26pid%3DApi&f=1&ipt=59cc14ce75f86619ad53c463ad4fc736c78b0df5570b88376288a08d4e38098a&ipo=images";
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.maxFinite,
            height: 200,
            color: Colors.purple,
          ),

          const TextWidget(
            "Honda Hr-V",
            customWeight: FontWeight.w700,
          ),
          const TextWidget(
            "2020 | São Paulo |31.400km",
            customFontsize: 13,
          ),
          const Divider(),
          const TextWidget(
            "R\$ 132.288",
            customWeight: FontWeight.w700,
          )
        ],
      ),
    );
  }
}