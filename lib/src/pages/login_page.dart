import 'package:app_navegacao/src/widgets/botao_widget.dart';
import 'package:app_navegacao/src/widgets/campo_formulario_widget.dart';
import 'package:flutter/material.dart';
import 'package:validatorless/validatorless.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  void _cadatrar() {
    Navigator.of(context).pushNamed("/cadastro");
  }

  void _acessar() {
    if (formKey.currentState!.validate()) {
      /*Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (_) => HomePage()),
        (route) => false,
      );*/
      Navigator.pushNamedAndRemoveUntil(
        context,
        '/home',
        (route) => false,
        arguments: emailController.text,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(height: 20),
                  Image.asset("assets/images/logo_empresa.png", height: 300),
                  SizedBox(height: 15),
                  Text(
                    "Login",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 15),
                  CampoFormularioWidget(
                    label: "E-Mail",
                    controller: emailController,
                    obscure: false,
                    icon: Icons.email,
                    validatorless: Validatorless.multiple([
                      Validatorless.required("Campo Obrigatório"),
                      Validatorless.email("E-mail Inválido"),
                    ]),
                  ),
                  SizedBox(height: 15),
                  CampoFormularioWidget(
                    label: "Senha",
                    controller: passwordController,
                    obscure: true,
                    icon: Icons.lock,
                    validatorless: Validatorless.required("Campo Obrigatório"),
                  ),
                  SizedBox(height: 15),
                  BotaoWidget(onclik: _acessar, title: "Entrar"),
                  SizedBox(height: 10),
                  TextButton(
                    onPressed: _cadatrar,
                    child: Text(
                      "Criar Conta",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20,
                        color: const Color(0xFF4169E1),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}