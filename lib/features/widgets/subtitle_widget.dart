import 'package:flutter/material.dart';
import 'package:flutter_auth_app/common/sizes.dart';

class SubTitleWidget extends StatelessWidget {
  final String title;
  const SubTitleWidget({
    super.key, required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
     padding: vertical10,
      child: Text(
       title,
        style: TextStyle(
       fontSize: 18,
       fontWeight: FontWeight.bold,
       color: Colors.white,
         ),
         ), 
         );
  }
}