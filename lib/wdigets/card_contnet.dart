import 'package:book/core/constants/app_colors.dart';
import 'package:book/core/constants/text_styles.dart';
import 'package:book/view/single_product_view.dart';
import 'package:book/wdigets/custom_container.dart';
import 'package:flutter/material.dart';

class CardContent extends StatelessWidget {
  const CardContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => ProductScreen()));
      },
      child: CustomContainer(
        margin: EdgeInsets.only(right: 12),
        borderRadius: BorderRadius.all(Radius.circular(9)),
        width: 159,
        child: Column(
          children: [
            Stack(
              children: [
                CustomContainer(
                  child: Image.asset('assets/images/man.png'),
                  color: AppColors.light2,
                  width: double.infinity,
                  height: 220,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 9.0, right: 12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Icon(Icons.favorite_border),
                    ],
                  ),
                )
              ],
            ),
            Column(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8.0, vertical: 5),
                  child: Row(
                    children: [
                      Container(
                        width: 100, // Set a specific width
                        child: Text(
                          "Men Trousers And Jacket",
                          style: TextStyles.mainStyle.copyWith(
                              fontSize: 14, fontWeight: FontWeight.w500),
                          overflow: TextOverflow.ellipsis,
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Row(
                    children: [
                      Text(
                        "\$55.00",
                        style: TextStyles.mainStyle.copyWith(
                            fontSize: 14, fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        width: 12,
                      ),
                      Text(
                        "1200",
                        style: TextStyle(
                          decoration: TextDecoration.lineThrough,
                        ),
                      )
                    ],
                  ),
                )
              ],
            )
          ],
        ),
        color: AppColors.light2,
        height: 281,
      ),
    );
  }
}
