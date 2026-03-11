import 'package:flutter/material.dart';

import '../../../../app/app_colors.dart';
import '../../../../app/constants.dart';

class IncrementDecrementBtn extends StatelessWidget {
  const IncrementDecrementBtn({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          '${Constants.takaSign}100',
          style: TextStyle(
            color: AppColors.themeColor,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        Column(
          children: [
            Row(
              children: [
                IconButton(
                  style: IconButton.styleFrom(
                    backgroundColor: Colors.teal.shade100,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8), // Border radius
                    ),
                  ),
                  onPressed: () {},
                  icon: Icon(Icons.remove),
                ),
                Text('01', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black54),),
                IconButton(
                  style: IconButton.styleFrom(
                    backgroundColor: AppColors.themeColor,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8), // Border radius
                    ),
                  ),
                  onPressed: () {},
                  icon: Icon(Icons.add),
                ),
              ],
            ),

          ],
        ),
      ],
    );
  }
}