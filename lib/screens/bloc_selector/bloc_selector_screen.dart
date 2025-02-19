import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterbloc/screens/bloc_selector/bloc/auth_bloc_selector_bloc.dart';
import 'package:flutterbloc/shared/widgets/custom_button_widget.dart';

import '../../shared/widgets/custom_textfield_widget.dart';

class BlocSelectorScreen extends StatelessWidget {
  BlocSelectorScreen({super.key});

  final _formkey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('BlocSelector')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Form(
            key: _formkey,
            child: Column(
              children: [
                _buildEmailTextField(),
                _buildPasswordTextField(),
                const SizedBox(height: 20),
                CustomButtonWidget(
                  onPressed: () {
                    if (_formkey.currentState!.validate()) {
                      // trigger the SignInUserEvent event, and do the logic for the email, and password values in the bloc
                      context
                          .read<AuthBlocSelectorBloc>()
                          .add(const SignInUserEvent());
                    }
                  },
                  label: 'Sign In',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildEmailTextField() {
    return BlocSelector<AuthBlocSelectorBloc, AuthBlocSelectorState, String>(
      // selecting email state to minimize rebuilds
      selector: (state) => state.email,
      builder: (context, email) {
        _emailController.text = email;
        return CustomTextFieldWidget(
          controller: _emailController,
          hintText: 'Email',
          validator: (value) {
            if (value != null && value.isEmpty) {
              return 'Enter your emaill address';
            }
            return null;
          },
          onChanged: (value) {
            //trigger the EmailAuthBlocSelectorEvent event
            context
                .read<AuthBlocSelectorBloc>()
                .add(EmailAuthBlocSelectorEvent(email: value));
          },
        );
      },
    );
  }

  Widget _buildPasswordTextField() {
    return BlocSelector<AuthBlocSelectorBloc, AuthBlocSelectorState, String>(
      // selecting password state to minimize rebuilds
      selector: (state) => state.password,
      builder: (context, password) {
        _passwordController.text = password;
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
          onChanged: (value) {
            //trigger the PasswordAuthBlocSelectorEvent event
            context
                .read<AuthBlocSelectorBloc>()
                .add(PasswordAuthBlocSelectorEvent(password: value));
          },
        );
      },
    );
  }
}
