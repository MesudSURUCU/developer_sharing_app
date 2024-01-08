import 'dart:convert';

class UserModel {

String? uid;
String name;
String surname;
String username;
String email;
String? profilePhoto;

UserModel({
  this.uid,
  required this.name,
  required this.surname,
  required this.username,
  required this.email,
  this.profilePhoto,
});

UserModel copyWith({

  String? uid,
  String? name,
  String? surname,
  String? username,
  String? email,
  String? profilePhoto,
}) {
  return UserModel(
  uid: uid ?? this.uid, 
  name: name ?? this.name, 
  surname: surname ?? this.surname, 
  username: username ?? this.username, 
  email: email ?? this.email,
  profilePhoto: profilePhoto ?? this.profilePhoto,
  );
}

Map<String,dynamic> toMap (){
  return <String,dynamic> {
    'uid' : uid,
    'name' : name,
    'surname' : surname,
    'username' : username,
    'email' : email,
    'profilePhoto' : profilePhoto,
  };
}

factory UserModel.fromMap(Map<String, dynamic> map){
  return UserModel(
    uid: map ['uid'] as String, 
    name: map ['name'] as String, 
    surname: map ['surname'] as String,
    username: map ['username'] as String, 
    email: map ['email'] as String,
    profilePhoto: map ['profilePhoto'] != null ? map ['profilePhoto'] as String : null,
    );
}

String toJson() => json.encode(toMap());

factory UserModel.fromJson(String source) => UserModel.fromMap(json.decode(source) as Map<String, dynamic>);

@override
String toString(){
  return 'UserMadel(uid: $uid, name: $name, surname: $surname, username: $username, email: $email, profilePhoto: $profilePhoto)';
}

@override
bool operator ==(covariant UserModel other){
  if(identical(this, other)) return true;

  return
     other.uid == uid && 
     other.name == name &&
     other.surname == surname &&
     other.username == username &&
     other.email == email &&
     other.profilePhoto == profilePhoto;
}

@override
int get hashCode {
  return uid.hashCode ^
    name.hashCode ^
    surname.hashCode ^
    username.hashCode ^
    email.hashCode ^
    profilePhoto.hashCode;
}


}