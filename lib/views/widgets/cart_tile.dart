import 'package:flutter/material.dart';
import 'package:marketky/constant/app_color.dart';
import 'package:marketky/core/model/Cart.dart';
import 'package:pecahan_rupiah/pecahan_rupiah.dart';

class CartTile extends StatelessWidget {
  final Cart data;

  const CartTile({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 80,
      padding: const EdgeInsets.only(top: 5, left: 5, bottom: 5, right: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColor.border, width: 1),
      ),
      child: Row(
        children: [
          // Product Image
          Container(
            width: 70,
            height: 70,
            margin: const EdgeInsets.only(right: 20),
            decoration: BoxDecoration(
              color: AppColor.border,
              borderRadius: BorderRadius.circular(16),
              image: DecorationImage(
                image: AssetImage(data.image.isNotEmpty ? data.image[0] : 'assets/images/placeholder.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Product Info
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Product Name
                Text(
                  data.name,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontFamily: 'poppins',
                    color: AppColor.secondary,
                  ),
                ),
                // Product Price + Quantity Buttons
                Container(
                  margin: const EdgeInsets.only(top: 4),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Product Price
                      Expanded(
                        child: Text(
                          Pecahan.rupiah(value: data.price, withRp: true),
                          style: const TextStyle(
                            fontWeight: FontWeight.w700,
                            fontFamily: 'poppins',
                            color: AppColor.primary,
                          ),
                        ),
                      ),
                      // Increment / Decrement Buttons
                      Container(
                        height: 26,
                        width: 80,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: AppColor.primarySoft,
                        ),
                        child: Row(
                          children: [
                            InkWell(
                              onTap: () {
                                // TODO: Decrement quantity logic
                                debugPrint('minus pressed');
                              },
                              child: Container(
                                width: 26,
                                height: 26,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: AppColor.primarySoft,
                                ),
                                child: const Text(
                                  '-',
                                  style: TextStyle(
                                    fontFamily: 'poppins',
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.symmetric(horizontal: 8),
                              child: FittedBox(
                                fit: BoxFit.scaleDown,
                                child: Text(
                                  '${data.count}',
                                  style: const TextStyle(
                                    fontFamily: 'poppins',
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                // TODO: Increment quantity logic
                                debugPrint('plus pressed');
                              },
                              child: Container(
                                width: 26,
                                height: 26,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: AppColor.primarySoft,
                                ),
                                child: const Text(
                                  '+',
                                  style: TextStyle(
                                    fontFamily: 'poppins',
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
