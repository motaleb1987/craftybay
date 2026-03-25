import 'package:craftybay/features/review/presentation/widget/review_add_section.dart';
import 'package:flutter/material.dart';

import '../widget/customer_comments.dart';

class CustomerReviewScreen extends StatelessWidget {
  const CustomerReviewScreen({
    super.key
  });
  static const String name = '/customer-review';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Customer Review')),
      body: Column(
        children: [
          Expanded(
            child:  Padding(
                padding: const EdgeInsets.all(16.0),
                child: ListView.builder(
                    itemCount: 10,
                    itemBuilder: (context, index){
                      return CustomerComments();
                    }
                ),
              ),
            ),

          ReviewAddSection()
        ],
      ),
    );
  }
}


