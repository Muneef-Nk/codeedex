import 'package:codeedex/core/color/color_contansts.dart';
import 'package:flutter/material.dart';

class Heading extends StatelessWidget {
  final String label;
  final Function() onPressed;
  const Heading({
    super.key,
    required this.label,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15, right: 20, left: 20, bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          InkWell(
            onTap: () {
              onPressed();
            },
            child: Text(
              'See all',
              style: TextStyle(
                fontSize: 18,
                color: AppColors.deepBlue,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
