import 'dart:async';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() => runApp(const MaterialApp(
      home: MyHome(),
    ));

class MyHome extends StatefulWidget {
  const MyHome({Key? key}) : super(key: key);

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  TextEditingController controller = TextEditingController();
  late Timer timer;

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Text("Selecciona tu servicio a salvar"),
          TextField(
            controller: controller,
          ),
          TextButton(
            onPressed: () {
              if (controller.text.isNotEmpty) {
                timer = Timer.periodic(const Duration(seconds: 5), (timer) {
                  fetchData(controller.text);
                });
              }
            },
            child: const Text("Activar Health"),
          ),
        ],
      ),
    );
  }

  void fetchData(String _url) async {
    final response = await http.get(Uri.parse(_url));
    if (response.statusCode == 200) {
      // Manejar la respuesta exitosa aquí
    } else {
      // Manejar cualquier error aquí
    }
  }
}
