import 'package:flutter/material.dart';
import '../../../../app/app_colors.dart';


class ReviewAddSection extends StatelessWidget {
  const ReviewAddSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.themeColor.withAlpha(30),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Text('Reviews (1000)', style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black54
              ),),

            ],
          ),
          SizedBox(
              width: 40,
              child: FilledButton(onPressed: (){}, child: Icon(Icons.add)))
        ],
      ),
    );
  }
}