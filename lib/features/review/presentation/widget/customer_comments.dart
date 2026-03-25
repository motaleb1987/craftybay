import 'package:craftybay/app/extensions/utils_extension.dart';
import 'package:flutter/material.dart';

class CustomerComments extends StatelessWidget {
  const CustomerComments({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Icon(Icons.account_circle, color: Colors.grey.shade300),
            SizedBox(width: 8),
            Text(
              'Motaleb Hossain',
              style: context.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
                color: Colors.black54,
              ),
            ),
            SizedBox(width: 30,),
            Text('25-Mar-26'),

          ],
        ),
        const SizedBox(height: 8),
        Text(
          textAlign: TextAlign.justify,
          '''Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs.“Lorem ipsum dolor sit amet, consectetur adipiscing elit”
                          ''',
          style: TextStyle(color: Colors.black54),
        ),
      ],
    );
  }
}
