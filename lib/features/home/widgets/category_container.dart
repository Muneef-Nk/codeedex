import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CategoryContainer extends StatelessWidget {
  final String icon;
  final String title;
  final Function() onpressed;
  const CategoryContainer({
    super.key,
    required this.icon,
    required this.title,
    required this.onpressed,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onpressed();
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          children: [
            CircleAvatar(
              radius: 28,
              backgroundColor: Colors.grey[200],
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SvgPicture.asset(icon),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              title,
              style: TextStyle(fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }
}
