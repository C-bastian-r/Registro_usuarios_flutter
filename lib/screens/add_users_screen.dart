import 'package:flutter/material.dart';
import 'package:registro_app/services/firebase_service.dart';

class AddUserWidget extends StatefulWidget {
  const AddUserWidget({super.key});

  @override
  State<AddUserWidget> createState() => _AddUserWidgetState();
}

class _AddUserWidgetState extends State<AddUserWidget> {
  TextEditingController nameController = TextEditingController(text: '');
  TextEditingController emailController = TextEditingController(text: '');
  TextEditingController passwordController = TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Agregar Usuario',
          style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
        ),
        backgroundColor: const Color.fromARGB(0, 29, 124, 202),
      ),
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
          Color.fromARGB(255, 60, 107, 158),
          Color.fromARGB(255, 71, 16, 105)
        ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
        padding: const EdgeInsets.all(30),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxHeight: 500, maxWidth: 400),
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(15)),
              padding: const EdgeInsets.all(25),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TextField(
                    cursorColor: Colors.blue,
                    controller: nameController,
                    decoration: const InputDecoration(labelText: 'Usuario', focusColor: Colors.blue),
                  ),
                  const SizedBox(height: 25),
                  TextField(
                    cursorColor: Colors.blue,
                    controller: emailController,
                    decoration: const InputDecoration(labelText: 'Email', focusColor: Colors.blue),
                  ),
                  const SizedBox(height: 25),
                  TextField(
                    cursorColor: Colors.blue,
                    controller: passwordController,
                    obscureText: true,
                    decoration: const InputDecoration(labelText: 'password', focusColor: Colors.blue),
                  ),
                  const SizedBox(height: 25),
                  OutlinedButton(
                      style: OutlinedButton.styleFrom(
                          foregroundColor: Colors.blue,
                          side: BorderSide(color: Colors.blue, width: 2)),
                      onPressed: () async {
                        await saveUser(nameController.text,
                                emailController.text, passwordController.text)
                            .then((_) {
                          Navigator.pop(context);
                        });
                      },
                      child: const Text('Guardar'))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
