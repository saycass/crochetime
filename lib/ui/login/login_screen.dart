import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../routing/routes.dart';
import '../core/themes/dimension.dart';
import '../core/ui/custom_text_form_field.dart';
import '../core/ui/gradient_background.dart';
import '../core/utils/regex.dart';
import 'login_viewmodel.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({
    super.key,
    required this.viewModel,
  });

  final LoginViewModel viewModel;

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
             GradientBackground(
              children: [
                const Text(
                  'Entre na sua\nConta',
                ),
                Dimension.smaller.vertical,
                const Text(
                  'Entre na sua Conta',
                ),
              ],
            ),
            Form(
              key: _formKey,
              child: Padding(
                padding: Dimension.medium.allPadding,
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
                            : Regex.email.hasMatch(value)
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
                                : Regex.password.hasMatch(value)
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
                    Dimension.medium.vertical,
                    ValueListenableBuilder(
                      valueListenable: fieldValidNotifier,
                      builder: (_, isValid, __) {
                        return FilledButton(
                          onPressed: () {
                            context.go(Routes.root.complete);
                            emailController.clear();
                            passwordController.clear();
                          },
                          child: const Text('Entrar'),
                        );
                      },
                    ),
                    Dimension.medium.vertical,
                    Divider(color: Colors.grey.shade200),
                  ],
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Não tem uma conta?',
                ),
                Dimension.smallest.vertical,
                TextButton(
                  onPressed: () {
                    // context.go(Routes.register.complete);
                  },
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
