import 'package:flutter/material.dart';
import 'package:flutter_auth_app/common/colors.dart';
import 'package:flutter_auth_app/common/paths.dart';
import 'package:flutter_auth_app/common/sizes.dart';
import 'package:flutter_auth_app/features/widgets/appbar_with_title.dart';
import 'package:flutter_auth_app/features/widgets/content_listview.dart';
import 'package:flutter_auth_app/features/widgets/subtitle_widget.dart';


class Discover extends StatelessWidget {
  const Discover({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(
        child: Padding(
          padding: scaffoldPadding,
           child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppBarWithTitle(title: "Discover"),
              Expanded(
            child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 15,
                  itemBuilder: (BuildContext context, int index) {
                   return Padding(
                     padding: horizontal5,
                     child: Column(
                       children: [
                         CircleAvatar(
                          radius: 30,
                          backgroundImage: AssetImage(profileImage),
                         ),
                         Padding(
                           padding: top10,
                           child: Text("Budi", style: 
                           TextStyle(
                            color: greyColor,
                            fontSize: 12,
                           ),),
                         )
                       ],
                     ),
                   );
                  },
                   ),


              ),
                SubTitleWidget(title: "Most Viewed Articles"),
              
                Expanded(
                flex: 2,
                child: ContentListView(),                
              ),
              SubTitleWidget(title: "Most Viewed Codes"),
            Expanded(
              flex: 2,
              child: ContentListView(),
              ),
            ],
              )
              ),
            ),
           );
         }
      
 }



                    
             
             
              
                   
                    
                   
                    
                  