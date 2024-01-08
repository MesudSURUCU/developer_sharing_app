import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth_app/common/colors.dart';
import 'package:flutter_auth_app/common/sizes.dart';
import 'package:flutter_auth_app/features/profile/controller/profile_controller.dart';
import 'package:flutter_auth_app/model/user_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Profile extends ConsumerWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: scaffoldPadding,
          child: FutureBuilder<UserModel>(
            future: ref.read(ProfileControllerProvider).getUser(),
            builder: (context, snapshot) {
              if (snapshot.hasData){
                final userModel=snapshot.data!;
              return Align(
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,               
                  children: [
                    Padding(
                      padding: vertical10,
                      child: CircleAvatar(
                        backgroundColor: profilePhotoCircleColor,
                        radius: 50,
                        child: CircleAvatar(
                          backgroundColor: profilePhotoCircleColor,
                          radius: 48,
                          backgroundImage: CachedNetworkImageProvider(
                            userModel.profilePhoto!
                           ),
                           ),
                      ),
                    ),
                    Padding(
                      padding: vertical10,
                      child: Text(
                        "@${userModel.username}",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: titleColor,
                        ),
                      ),
                      ),
                      Padding(
                      padding: vertical10,
                      child: Text(
                        "${userModel.name} ${userModel.surname}",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: titleColor,
                        ),
                      ),
                      ),
                      MaterialButton(
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4.0),
                      ),
                      color: profilePhotoCircleColor,  
                      onPressed: (){},
                      minWidth: 200,
                      child: Padding(
                        padding: vertical10,
                        child: Text("Edit Profile", style: TextStyle(
                          color: containerColor ),),
                      ),)
                  ]
                  ),
              );
              } 
              else if (snapshot.connectionState==ConnectionState.waiting){
                return Center(child: CircularProgressIndicator(),);
              }
              else{
                return Center(child: Text("Something went wrong"),);
              }
                
              
            }),
          ),
          ),
    );
  }
}