import 'package:flutter/material.dart';
import 'package:flutter_application_2/presentation/screens/auth_screen/login_bloc/login_bloc.dart';
import 'package:flutter_application_2/presentation/screens/auth_screen/widgets/custom_button.dart';
import 'package:flutter_application_2/presentation/screens/auth_screen/widgets/custom_text_field.dart';
import 'package:flutter_application_2/theme/styles.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});
  @override
  // ignore: library_private_types_in_public_api
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final loginController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    loginController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Login to your account'),
          ),
          body: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Логин',
                      style: tStyleFont,
                    ),
                    const SizedBox(height: 5),
                    MyTextField(
                      controller: loginController,
                      hintText: 'Email',
                      obscureText: false,
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'Пароль',
                      style: tStyleFont,
                    ),
                    const SizedBox(height: 5),
                    MyTextField(
                      controller: passwordController,
                      hintText: 'Password',
                      obscureText: true,
                    ),
                    const SizedBox(height: 25),
                    BlocListener<LoginBloc, LoginState>(
                      listener: (context, state) {
                        if (state is LoginSucces) {
                          context.go('/home');
                        }
                      },
                      child: MyButton(
                        onTap: () {
                          BlocProvider.of<LoginBloc>(context).add(
                            EnterLoginEvent(
                                email: loginController.text,
                                password: passwordController.text),
                          );
                        },
                        name: 'Sign in',
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      
    
  }
}
