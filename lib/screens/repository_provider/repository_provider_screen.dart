import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../shared/widgets/custom_button_widget.dart';
import '../../shared/widgets/custom_textfield_widget.dart';
import 'bloc/auth_repository_bloc.dart';

class RepositoryProviderScreen extends StatelessWidget {
  RepositoryProviderScreen({super.key});

  final _formkey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('RepositoryProvider')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: BlocConsumer<AuthRepositoryBloc, AuthRepositoryState>(
            listener: (context, state) {
              if (state is AuthSuccess) {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text('Sign in successfully: ${state.email}')));
              }
              if (state is AuthFailure) {
                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Unable to sign in')));
              }
            },
            builder: (context, state) {
              return Form(
                key: _formkey,
                child: Stack(
                  children: [
                    Column(
                      children: [
                        _buildEmailTextField(),
                        _buildPasswordTextField(),
                        const SizedBox(height: 20),
                        CustomButtonWidget(
                          onPressed: () {
                            if (_formkey.currentState!.validate()) {
                              // trigger the AuthSignInEvent
                              context.read<AuthRepositoryBloc>().add(AuthSignIn(
                                    email: _emailController.text,
                                    password: _passwordController.text,
                                  ));
                            }
                          },
                          label: 'Sign In',
                        ),
                      ],
                    ),
                    if (state is AuthLoading)
                      const Center(child: CircularProgressIndicator())
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildEmailTextField() {
    return CustomTextFieldWidget(
      controller: _emailController,
      hintText: 'Email',
      validator: (value) {
        if (value != null && value.isEmpty) {
          return 'Enter your emaill address';
        }
        return null;
      },
      onChanged: (value) {},
    );
  }

  Widget _buildPasswordTextField() {
    return CustomTextFieldWidget(
      controller: _passwordController,
      hintText: 'Password',
      isObscure: true,
      validator: (value) {
        if (value != null && value.isEmpty) {
          return 'Enter your password';
        }
        return null;
      },
      onChanged: (value) {},
    );
  }
}
