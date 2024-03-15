import 'package:flutter/material.dart';
import 'package:mahfazty/core/helpers/spacing.dart';
import 'package:mahfazty/core/theming/fonts.dart';

class ExpenseTileWidget extends StatelessWidget {
  const ExpenseTileWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 15),
      decoration: const BoxDecoration(
          color: Color.fromARGB(255, 41, 39, 78),
          borderRadius: BorderRadius.all(Radius.circular(16))),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Electricity",
                      style: FontHelper.font18BoldWhite,
                    ),
                    verticalSpace(10),
                    Text(
                      "2 June,2024",
                      style: FontHelper.font13GreyW300,
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: Text(
                    "-200 EGP",
                    style: FontHelper.font18BoldWhite,
                  ),
                )
              ],
            ),
          ),
          Positioned(
              top: 0,
              bottom: 0,
              right: 0,
              child: Container(
                height: double.infinity,
                width: 20,
                decoration: const BoxDecoration(
                    color: Colors.orange,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(16),
                        bottomRight: Radius.circular(16))),
              ))
        ],
      ),
    );
  }
}
