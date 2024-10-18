import 'package:flutter/material.dart';
import 'package:registro_app/services/firebase_service.dart';

class UsersListView extends StatefulWidget {
  const UsersListView({super.key});

  @override
  State<UsersListView> createState() => _UsersListViewState();
}

class _UsersListViewState extends State<UsersListView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AppBar', style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.blue,
      ),
      body: FutureBuilder(
          future: getUsers(),
          builder: ((context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data?.length,
                itemBuilder: (context, index) {
                  return Dismissible(
                    onDismissed: (direction) async{
                      await deleteUser(snapshot.data?[index]['uid']);
                      snapshot.data?.remove(index);
                    },
                    key: Key(snapshot.data?[index]['uid']),
                    direction: DismissDirection.startToEnd,
                    confirmDismiss: (direction) async {
                      bool result = false;
                      result = await showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: Text(
                                  'Seguro que deseas eliminar a ${snapshot.data?[index]['name']}?'),
                              actions: [
                                TextButton(
                                    onPressed: () {
                                      Navigator.pop(context, false);
                                    },
                                    child: const Text('Cancelar',
                                        style: TextStyle(color: Colors.red))),
                                TextButton(
                                    onPressed: () {
                                      Navigator.pop(context, true);
                                    },
                                    child: const Text('continuar',
                                        style: TextStyle(color: Colors.blue)))
                              ],
                            );
                          });
                      return result;
                    },
                    background: Container(
                      color: Colors.red,
                      child: const Icon(Icons.arrow_forward, color: Colors.white,),
                    ),
                    child: ListTile(
                      title: Text(snapshot.data?[index]['name']),
                      onTap: (() async {
                        await Navigator.pushNamed(context, '/edit', arguments: {
                          'uid': snapshot.data?[index]['uid'],
                          'name': snapshot.data?[index]['name'],
                          'email': snapshot.data?[index]['email'],
                        });
                        setState(() {});
                      }),
                    ),
                  );
                },
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          })),
      floatingActionButton: FloatingActionButton(
          onPressed: () async {
            await Navigator.pushNamed(context, '/add');
            setState(() {});
          },
          child: const Icon(Icons.add)),
    );
  }
}
