import 'package:flutter/material.dart';
import 'package:flutter_auth_app/common/paths.dart';
import 'package:flutter_auth_app/common/sizes.dart';

class ContentListView extends StatelessWidget {
  const ContentListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: 2,
      itemBuilder: (BuildContext context,int index) {
        return Padding(                      
          padding: right10,
          child: AspectRatio(
            aspectRatio: 16/10,
            child: Container(                                          
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.blueGrey,
                 image: DecorationImage(
                                image: AssetImage(
                                  bookmarkImage,
                                ),
                                fit: BoxFit.cover,
              ),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: all10,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Prepare for your first skateboatd jump",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,                                   
                          ),
                          ),
                            Text("Mesud SÜRÜCÜ",
                                style: TextStyle(fontSize: 14, color: Colors.white),
                ),
                            Text("125,988 views",
                                style: TextStyle(fontSize: 13, color: Colors.white),
                ),   
                           Text("2 days ago",
                                style: TextStyle(fontSize: 13, color: Colors.white),
                ),         
                        ],
                      ),
                    ),
                    ),
                    Expanded(
                      child: Padding(                                  
                        padding: all10,
                        child: AspectRatio(
                          aspectRatio: 10/16,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.blueGrey,
                             
         ),
       ),                                       
      ),
     ),
    ),                   
                ],
              ),
            ),
          ),
        );        
      },
    );
  }
}