import 'package:flutter/material.dart';
import 'package:flutter_auth_app/common/paths.dart';
import 'package:flutter_svg/svg.dart';

class AppBarWithTitle extends StatelessWidget {
  final String title;
  const AppBarWithTitle({
    super.key, required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children:[   
            Text(title,
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              ),
             ),
            IconButton(onPressed: (){}, icon: SvgPicture.asset(searchSvg),
            ),  
                ],
              );
  }
}