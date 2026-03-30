import 'package:app_navegacao/src/pages/home_page.dart';
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

  void _cadastrar(){
    Navigator.of(context).pushNamed("/cadastro");
  }

  void _acessar(){
    if(formKey.currentState!.validate()){
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (_) => HomePage()),
         (route)=> false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(height: 20),
                  Image.asset("assets/images/logo_empresa.png",height: 300),
                  SizedBox(height: 15),
                  Text(
                    "Login",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  SizedBox(height: 15),
                  CampoFormularioWidget(
                    label: "E-mail",
                    controller: emailController,
                    obscure: false,
                    icon: Icons.email,
                    validatorless: Validatorless.multiple([
                      Validatorless.required("Campo obrigatorio"),
                      Validatorless.email("Email invalido")
                    ]),
                  ),
                  SizedBox(height: 18),
                  CampoFormularioWidget(
                    label: "Password",
                    controller: passwordController,
                    obscure: true,
                    icon: Icons.lock,
                    validatorless: Validatorless.required("Campo obrigatorio"),
                  ),
                  SizedBox(height: 18),
                  BotaoWidget(onclik: _acessar, title: "Entrar"),
                  SizedBox(height: 10),
                  TextButton(
                    onPressed: _cadastrar,
                    child: Text(
                      "Criar Conta",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 15,
                        color: const Color.fromARGB(255, 32, 134, 250),
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