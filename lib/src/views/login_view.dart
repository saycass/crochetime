import 'package:flutter/material.dart';

import '../app/crochet_timer_app.dart';
import '../constants.dart';
import '../helper/navigation_helper.dart';
import '../theme/theme.dart';
import '../widgets/custom_text_form_field.dart';
import '../widgets/gradient_background.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  final ValueNotifier<bool> passwordNotifier = ValueNotifier(true);
  final ValueNotifier<bool> fieldValidNotifier = ValueNotifier(false);

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const GradientBackground(
              children: [
                Text(
                  'Entre na sua\nConta',
                  style: AppTheme.titleLarge,
                ),
                SizedBox(height: 6),
                Text('Entre na sua Conta', style: AppTheme.bodySmall),
              ],
            ),
            Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    CustomTextFormField(
                      controller: emailController,
                      labelText: 'Apelido',
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.next,
                      onChanged: (_) => _formKey.currentState?.validate(),
                      validator: (value) {
                        return value!.isEmpty
                            ? 'Digite seu apelido'
                            : AppRegex.emailRegex.hasMatch(value)
                                ? null
                                : 'Apelido inválido';
                      },
                    ),
                    ValueListenableBuilder(
                      valueListenable: passwordNotifier,
                      builder: (_, passwordObscure, __) {
                        return CustomTextFormField(
                          obscureText: passwordObscure,
                          controller: passwordController,
                          labelText: 'Senha',
                          textInputAction: TextInputAction.done,
                          keyboardType: TextInputType.visiblePassword,
                          onChanged: (_) => _formKey.currentState?.validate(),
                          validator: (value) {
                            return value!.isEmpty
                                ? 'Digite sua senha'
                                : AppRegex.passwordRegex.hasMatch(value)
                                    ? null
                                    : 'Senha inválida';
                          },
                          suffixIcon: IconButton(
                            onPressed: () =>
                                passwordNotifier.value = !passwordObscure,
                            style: IconButton.styleFrom(
                              minimumSize: const Size.square(48),
                            ),
                            icon: Icon(
                              passwordObscure
                                  ? Icons.visibility_off_outlined
                                  : Icons.visibility_outlined,
                              size: 20,
                              color: Colors.black,
                            ),
                          ),
                        );
                      },
                    ),
                    TextButton(
                      onPressed: () {},
                      child: const Text('Esqueci minha senha'),
                    ),
                    const SizedBox(height: 20),
                    ValueListenableBuilder(
                      valueListenable: fieldValidNotifier,
                      builder: (_, isValid, __) {
                        return FilledButton(
                          onPressed: () {
                            NavigationHelper.pushNamed(
                              AppRoutes.home,
                            );
                            emailController.clear();
                            passwordController.clear();
                          },
                          child: const Text('Entrar'),
                        );
                      },
                    ),
                    const SizedBox(height: 20),
                    Divider(color: Colors.grey.shade200),
                  ],
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Não tem uma conta?',
                  style: AppTheme.bodySmall.copyWith(color: Colors.black),
                ),
                const SizedBox(width: 4),
                TextButton(
                  onPressed: () => NavigationHelper.pushNamed(
                    AppRoutes.register,
                  ),
                  child: const Text('Crie uma conta'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
