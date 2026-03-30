import 'package:app_navegacao/src/pages/home_page.dart';
import 'package:app_navegacao/src/widgets/botao_widget.dart';
import 'package:app_navegacao/src/widgets/campo_formulario_widget.dart';
import 'package:flutter/material.dart';
import 'package:validatorless/validatorless.dart';

class CadastroPage extends StatefulWidget {
  const CadastroPage({super.key});

  @override
  State<CadastroPage> createState() => _CadastroPageState();
}

class _CadastroPageState extends State<CadastroPage> {
  final nomeController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confPasswordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  void _resgistrar(){
    if(formKey.currentState!.validate()){
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (_)=> HomePage()), 
        (route)=>false);
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color(0xFF4169E1),
        foregroundColor: const Color(0xFFFFFFFF),
        title: Text("Cadastro", style: TextStyle(fontSize: 25)),
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 15),
              CampoFormularioWidget(
                label: "Nome",
                controller: nomeController,
                obscure: false,
                validatorless: Validatorless.required("Campo Obrigatório"),
              ),
              SizedBox(height: 15),
              CampoFormularioWidget(
                label: "E-mail",
                controller: emailController,
                obscure: false,
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
                validatorless: Validatorless.multiple([
                  Validatorless.required("Campo Obrigatório"),
                  Validatorless.min(8, 'Minimo 8 Caracteres')
                ]),
              ),
              SizedBox(height: 15),
              CampoFormularioWidget(
                label: "Confirmar Senha",
                controller: confPasswordController,
                obscure: true,
                validatorless: Validatorless.multiple([
                  Validatorless.required("Campo obrigatorio"),
                  Validatorless.compare(passwordController, "Senhas diferentes")
                ]),
              ),
              SizedBox(height: 25),
              BotaoWidget(onclik: _resgistrar, title: "Cadastrar"),
            ],
          ),
        ),
      ),
    );
  }
}