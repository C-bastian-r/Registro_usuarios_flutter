import 'package:cloud_firestore/cloud_firestore.dart';

//archivo de ORM de firebase

FirebaseFirestore db = FirebaseFirestore.instance;

//traer todos los usuarios
Future<List> getUsers() async {
  List users = [];
  QuerySnapshot querySnapshot = await db.collection('users').get();
  for (var doc in querySnapshot.docs) {
    final Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    var user = {
    'uid': doc.id,
    'name': data['name'],
    'email': data['email'],
    'password': data['password'],
  };
    users.add(user);
  }
  return users;
}

//guardar usuario en bd
Future<void> saveUser(String name, String email, String password) async {
  var user = {
    'name': name,
    'email': email,
    'password': password,
  };
  await db.collection('users').add(user);
}

//actualiza de usuario
Future<void> updateUser(String uid, String newName, String newEmail) async {
  await db
      .collection('users')
      .doc(uid)
      .set({'name': newName, 'email': newEmail});
}

//elimina usuario
Future<void> deleteUser(String uid) async{
  await db.collection('users').doc(uid).delete();
}