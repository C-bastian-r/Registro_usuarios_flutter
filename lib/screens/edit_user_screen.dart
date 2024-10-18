import 'package:flutter/material.dart';
import 'package:registro_app/services/firebase_service.dart';

class EditUserScreen extends StatefulWidget {
  const EditUserScreen({super.key});

  @override
  State<EditUserScreen> createState() => _EditUserScreenState();
}

class _EditUserScreenState extends State<EditUserScreen> {
  TextEditingController nameController = TextEditingController(text: '');
  TextEditingController emailController = TextEditingController(text: '');
  TextEditingController passwordController = TextEditingController(text: '');
  @override
  Widget build(BuildContext context) {
    final Map arguments = ModalRoute.of(context)!.settings.arguments as Map;
    nameController.text = arguments['name'];
    emailController.text = arguments['email'];
    return Scaffold(
      appBar: AppBar(
          title: const Text(
            'Editar usuario',
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: const Color.fromARGB(0, 29, 124, 202)),
      body: Container(
        padding: const EdgeInsets.all(30),
        decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
          Color.fromARGB(255, 60, 107, 158),
          Color.fromARGB(255, 71, 16, 105)
        ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxHeight: 350, maxWidth: 400),
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(15)),
              padding: const EdgeInsets.all(25),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TextField(
                    controller: nameController,
                    decoration: const InputDecoration(labelText: 'Usuario'),
                  ),
                  const SizedBox(height: 25),
                  TextField(
                    controller: emailController,
                    decoration: const InputDecoration(labelText: 'Email'),
                  ),
                  const SizedBox(height: 25),
                  OutlinedButton(
                      style: OutlinedButton.styleFrom(
                          foregroundColor: Colors.blue,
                          side: const BorderSide(color: Colors.blue, width: 2)),
                      onPressed: () async {
                        await updateUser(arguments['uid'], nameController.text,
                                emailController.text)
                            .then((_) {
                          Navigator.pop(context);
                        });
                      },
                      child: const Text('Actualizar'))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
