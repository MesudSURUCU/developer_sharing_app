import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth_app/common/colors.dart';
import 'package:flutter_auth_app/common/paths.dart';
import 'package:flutter_auth_app/common/sizes.dart';
import 'package:flutter_auth_app/features/auth/views/sign_in.dart';
import 'package:flutter_auth_app/features/more/controller/more_controller.dart';
import 'package:flutter_auth_app/features/more/view/write_article.dart';
import 'package:flutter_auth_app/features/profile/controller/profile_controller.dart';
import 'package:flutter_auth_app/features/widgets/subtitle_widget.dart';
import 'package:flutter_auth_app/model/user_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

class More extends ConsumerWidget {
  const More({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: FutureBuilder<UserModel>(
        future: ref.read(ProfileControllerProvider).getUser(),
        builder: (context, snapshot) {
          if(snapshot.hasData) {
            final UserModel = snapshot.data!;
          return SafeArea(
            child: Padding(
              padding: scaffoldPadding, 
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("More",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                      ),
                       Padding(
                      padding: vertical10,
                      child: CircleAvatar(
                        backgroundColor: profilePhotoCircleColor,
                        radius: 20,
                        backgroundImage: CachedNetworkImageProvider(
                          UserModel.profilePhoto!
                         ),
                         ),
                    ),
                    ],
                  ),
                  SubTitleWidget(title: "Create Content"),
                      MenuItem(title: "Write an article!", 
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (_) => WriteArticle(currentUser: UserModel,)));
                      },
                      leadingAsset: articleSvg),
                      MenuItem(title: "Let's try the coding page", 
                      onTap: (){},
                      leadingAsset: codeSvg),
                      MenuItem(title: "Your articles", 
                      onTap: (){},
                      leadingAsset: articleSvg),
                      MenuItem(title: "Your code repos", 
                      onTap: (){},
                      leadingAsset: codeSvg),
                  SubTitleWidget(title:"Profile"),
                      MenuItem(title: "Edit profile", 
                      onTap:(){},
                      leadingAsset: editProfileSvg),
                      MenuItem(title: "Sign out",
                      onTap: (){
                        ref
                        .read(moreControllerProvider)
                        .signOut()
                        .whenComplete(() => Navigator.pushAndRemoveUntil(context, 
                        MaterialPageRoute(builder: (_) => SignIn()), (route) => false));
                      },
                      leadingAsset: signOutSvg),
                ],
                ),
                ),
                );
        }
        else if (snapshot.connectionState==ConnectionState.waiting){
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        else {
          return Center(
            child: Text("Error"),
          );
        }
        }
      ),
    );
  }

  Padding _title(String title) {
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

class MenuItem extends StatelessWidget {
  
  const MenuItem({
    super.key, 
    this.onTap, 
    required this.title, 
    required this.leadingAsset, 
  });

  final Function()? onTap;
  final String title;
  final String leadingAsset;
  

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: vertical5,
        child: Card(
          elevation: 10,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)
          ),
          color: activeColor,
          child: ListTile(
            leading: SvgPicture.asset(
              leadingAsset),
              title: Text(title, style: TextStyle(
                color: Colors.white,
                fontSize: 16),
                ),
                trailing: Icon(Icons.arrow_forward_ios_rounded, color: Colors.white,),
              ),
              
        ),
      ),
    );
  }
}