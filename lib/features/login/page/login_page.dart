import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  final LoginController controller;
  LoginPage({required this.controller});

  final emailCtrl = TextEditingController();
  final passCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Observer(builder: (_) {
        return Column(
          children: [
            TextField(controller: emailCtrl, decoration: InputDecoration(label: Text('Email'))),
            TextField(controller: passCtrl, decoration: InputDecoration(label: Text('Senha')), obscureText: true),
            if (controller.error.isNotEmpty) Text(controller.error, style: TextStyle(color: Colors.red)),
            ElevatedButton(
              onPressed: controller.loading
                  ? null
                  : () async {
                      bool success = await controller.login(emailCtrl.text, passCtrl.text);
                      if (success) Navigator.pushReplacementNamed(context, '/home');
                    },
              child: controller.loading ? CircularProgressIndicator() : Text('Entrar'),
            ),
            TextButton(onPressed: () => Navigator.pushNamed(context, '/register'), child: Text('Registrar-se')),
          ],
        );
      }),
    );
  }
}