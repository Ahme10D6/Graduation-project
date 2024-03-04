import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gradproject/app/constants/constants.dart';
import 'package:gradproject/app/constants/routes_constants.dart';
import 'package:gradproject/presentation/styles/colors.dart';
import 'package:gradproject/presentation/ui/common/text_input_field.dart';
import 'package:gradproject/presentation/ui/login_page/view_model/login_model.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<LoginViewModel>(
      create: (context) => LoginViewModel(),
      builder: (context, child) {
        return const LoginContent();
      },
    );
  }
}

class LoginContent extends StatefulWidget {
  const LoginContent({super.key});

  @override
  State<LoginContent> createState() => _LoginContentState();
}

class _LoginContentState extends State<LoginContent> {
  late final LoginViewModel _loginViewModel;
  // final TextEditingController _userNameController = TextEditingController();
  // final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  void _bind(BuildContext context) {
    _loginViewModel = Provider.of<LoginViewModel>(context, listen: false);
    _loginViewModel.start();
    _emailController
        .addListener(() => _loginViewModel.setUserName(_emailController.text));
    _passwordController.addListener(
        () => _loginViewModel.setPassword(_passwordController.text));
  }

  @override
  void initState() {
    _bind(context);
    super.initState();
  }

  Widget get body {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.only(top: 78),
          alignment: Alignment.center,
          child: Column(
            children: [
              const Text(
                'Login',
                style: TextStyle(
                  fontSize: 35,
                  color: textColor,
                  fontFamily: 'Katibeh',
                  fontWeight: FontWeight.w900,
                ),
              ),
              const SizedBox(
                height: 125,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.only(left: 20, right: 20),
                child: TextInputField(
                  controller: _emailController,
                  labelText: 'Email',
                  icon: Icons.email,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.only(left: 20, right: 20),
                child: TextInputField(
                  controller: _passwordController,
                  labelText: 'Password',
                  icon: Icons.lock,
                  isObscure: true,
                ),
              ),
              const SizedBox(
                height: 35,
              ),
              Container(
                width: MediaQuery.of(context).size.width - 85,
                height: 57,
                decoration: const BoxDecoration(
                  color: buttonColor,
                  borderRadius: BorderRadius.all(
                    Radius.circular(
                      50,
                    ),
                  ),
                ),
                child: InkWell(
                  onTap: () {
                    _loginViewModel.login(context);
                  },
                  child: const Center(
                    child: Text(
                      'Login',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 158),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/images/continue.png'),
                ],
              ),
              const SizedBox(
                height: 21,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: Image.asset('assets/images/facebook.png'),
                    onPressed: () {},
                  ),
                  const SizedBox(width: 30.0),
                  IconButton(
                    icon: Image.asset('assets/images/google.png'),
                    onPressed: () {},
                  ),
                  const SizedBox(width: 30.0),
                  IconButton(
                    icon: Image.asset('assets/images/apple.png'),
                    onPressed: () {},
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return body;
    // Scaffold(
    //   // appBar: _getAppBar,
    //   body: _getBody,
    // );
  }
}
