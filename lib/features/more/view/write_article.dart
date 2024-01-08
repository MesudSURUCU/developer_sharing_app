import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_auth_app/common/colors.dart';
import 'package:flutter_auth_app/common/paths.dart';
import 'package:flutter_auth_app/common/repository/common_firebase_storage.dart';
import 'package:flutter_auth_app/common/sizes.dart';
import 'package:flutter_auth_app/common/utils.dart';
import 'package:flutter_auth_app/features/more/controller/more_controller.dart';
import 'package:flutter_auth_app/model/article_model.dart';
import 'package:flutter_auth_app/model/user_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uuid/uuid.dart';

class WriteArticle extends ConsumerStatefulWidget {
  final UserModel currentUser;
  
  const WriteArticle({super.key, required this.currentUser});

  @override
  ConsumerState<WriteArticle> createState() => _WriteArticleState();
}

class _WriteArticleState extends ConsumerState<WriteArticle> {
  XFile? image;
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _contentController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _titleController.dispose();
    _contentController.dispose();
    super.dispose();
  }
  void pickImage() async {
    image = await pickImageFromGallery();
    setState(() {
      
    });
  }
  @override
  Widget build(BuildContext context) {
    return Form(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      key: _formKey,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(onPressed: () => Navigator.pop(context), icon: Icon(Icons.arrow_back_ios_new),color: Colors.white,),
          title: Text("Your Article",
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Colors.white
          ),
          ),
          actions: [
            IconButton(onPressed: () {
              if (_formKey.currentState!.validate()) {
                final user = widget.currentUser;
                ref.read(CommonFSRepositoryProvider).storeFileToFirebase(
                  "articles/${user.uid}/${DateTime.now().microsecondsSinceEpoch}",
                  File(image!.path),
                  ).then((value) {
                   String uid = Uuid().v4();
                   ArticleModel articleModel = ArticleModel(
                    uid: uid, 
                    title: _titleController.text, 
                   content: _contentController.text, 
                   author: user.name+""+user.surname, 
                   authorUid: user.uid!, 
                   authorImg: user.profilePhoto!, 
                   createdAt: DateTime.now(), 
                   claps: 0, 
                   views: 0,);
                   ref
                   .read(moreControllerProvider)
                   .writeArticle(articleModel);
                  });
              }
            }, 
            icon: Icon(Icons.done, color: Colors.white,))
          ],
          ),
          body: Padding(padding: scaffoldPadding,
          child: Column(
            children: [
              Padding(
                padding: vertical10,
                child: GestureDetector(
                  onTap: (){
                    pickImage();
                  },
                  child: AspectRatio(aspectRatio: 16/9, 
                  child: Container(
                   decoration: BoxDecoration(
                    color: activeColor,
                    borderRadius: BorderRadius.circular(20),
                    image: image != null ? DecorationImage(image: FileImage(File(image!.path)),
                    fit: BoxFit.cover
                    )
                    : null,
                   ),
                   child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                     children: [
                      image == null ? SvgPicture.asset(addImageSvg) : SizedBox(),
                     ],
                   ),
                  ),
                  ),
                ),
              ),
              TextFormField(
                 validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please fill the title";
                    }
                    return null;
                  },
                controller: _titleController,
                style: TextStyle(fontSize: 17, color: Colors.white),
                decoration: InputDecoration(
                  hintText: "Your Title Here!",
                  hintStyle: TextStyle(fontSize: 17, color: greyColor),
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                  )
                ),
              ),
               Expanded(
                 child: TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please fill the content";
                    }
                    return null;
                  },
                   controller: _contentController,
                   style: TextStyle(fontSize: 17, color: Colors.white),
                   maxLines: 100,
                   decoration: InputDecoration(
                     hintText: "Your Article Here!",
                     hintStyle: TextStyle(fontSize: 17, color: greyColor),
                     border: OutlineInputBorder(
                       borderSide: BorderSide.none,
                     )
                   ),
                 ),
               ),
            ]
            ),
            ),
      ),
    );
  }
}