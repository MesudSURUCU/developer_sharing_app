import 'package:flutter/material.dart';
import 'package:flutter_auth_app/common/colors.dart';
import 'package:flutter_auth_app/common/paths.dart';
import 'package:flutter_auth_app/common/sizes.dart';
import 'package:flutter_auth_app/features/widgets/appbar_with_title.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Bookmark extends StatelessWidget {
  const Bookmark({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: scaffoldPadding,
            child: Column(
              children: [
                AppBarWithTitle(title: "Bookmark",),
            Expanded(
              child: ListView.builder(
              itemCount: 15,
              itemBuilder: (BuildContext context, int index){
                return Padding(
                  padding: vertical10,
                  child: Row(
                    children: [
                      Expanded(
                        flex: 4,
                        child: AspectRatio(
                          aspectRatio: 16/9,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              image: DecorationImage(image: AssetImage(
                                bookmarkImage
                              ),
                              fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 5,
                        child:  Padding(
                          padding: horizontal10,
                          child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                              Text("For My Project Need",
                              style: TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.clip,
                              ),
                              Text("Mesud SÜRÜCÜ",
                              style: TextStyle(fontSize: 14, color: greyColor),
                              ),
                              Text("125,988 views  - 2 days ago",
                              style: TextStyle(fontSize: 13, color: greyColor),
                              ),              
                                    ],
                              ),
                        ),
                            ),
                      Expanded(
                        flex: 2,
                        child: Padding(
                          padding: horizontal10,
                          child: CircleAvatar(
                            backgroundColor: activeColor,
                            child: SvgPicture.asset(bookmarkSvg, 
                            colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn),),
                          ),
                        ),
                        ),
                    ],
                  ),
                );
              }, 
              ),
              ),
              ],
              ),
              ),
               ),
      ),
    );
  }
}