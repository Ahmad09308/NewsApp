// ignore_for_file: file_names, sized_box_for_whitespace

import 'package:aa/Auth/translator/bloc/git_data_bloc.dart';
import 'package:aa/core/bloc/app_manager_bloc.dart';
import 'package:aa/core/model/loginModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Loigin extends StatelessWidget {
  Loigin({super.key});
  final TextEditingController password = TextEditingController();
  final TextEditingController username = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GitDataBloc(),
      child: Builder(builder: (context) {
        return Scaffold(
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Image.asset(
                  'assets/logo.png',
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30, right: 30),
                child: Container(
                  height: 500,
                  child: Column(
                    children: [
                      TextField(
                        controller: username,
                        decoration: const InputDecoration(
                          hintText: 'Username',
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const TextField(
                        decoration: InputDecoration(
                          hintText: 'Email',
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 40),
                        child: TextField(
                          obscureText: State is PasswordHidden,
                          decoration: InputDecoration(
                            hintText: 'Password',
                            suffixIcon: IconButton(
                              icon: const Icon(
                                State is PasswordVisible
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                              ),
                              onPressed: () {
                                context
                                    .read<GitDataBloc>()
                                    .add(TogglePasswordVisibility());
                              },
                            ),
                          ),
                          controller: password,
                        ),
                      ),
                      InkWell(
                        onTap: () {},
                        child: const Text(
                          'Forgot Password?',
                          style: TextStyle(
                              fontWeight: FontWeight.w700, fontSize: 15),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      // const Row(
                      //   children: [
                      //     CircleAvatar(
                      //       radius: 11,
                      //       backgroundColor: Colors.black,
                      //       child: CircleAvatar(
                      //           radius: 10,
                      //           backgroundColor:
                      //               Color.fromARGB(255, 245, 242, 242),
                      //           child: Icon(
                      //             Icons.check_circle,
                      //             size: 20,
                      //           )),
                      //     ),
                      //     Text('Media Rerporter'),
                      //     SizedBox(
                      //       width: 30,
                      //     ),
                      //     CircleAvatar(
                      //       radius: 11,
                      //       backgroundColor: Colors.black,
                      //       child: CircleAvatar(
                      //           radius: 10,
                      //           backgroundColor:
                      //               Color.fromARGB(255, 245, 242, 242),
                      //           child: Icon(
                      //             Icons.check_circle,
                      //             size: 20,
                      //           )),
                      //     ),
                      //     Text('Media Rerporter'),
                      //   ],
                      // )
                      BlocListener<GitDataBloc, GitDataState>(
                        listener: (context, state) {
                          if (state is SuccessToLogIn) {
                            context.read<AppManagerBloc>().add(HeLoggedIn());
                          }
                          if (state is FailedToLogIn) {
                            context
                                .read<AppManagerBloc>()
                                .add(HeFailedToLoggedIn());
                          }
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            width: 169,
                            height: 45,
                            child: FloatingActionButton(
                              onPressed: () {
                                context.read<GitDataBloc>().add(LogIn(
                                    user: UserModel(
                                        username: username.text,
                                        password: password.text)));
                              },
                              backgroundColor:
                                  const Color.fromRGBO(0, 31, 63, 1),
                              child: const Text(
                                'Sign In',
                                style: TextStyle(
                                    color: Color.fromRGBO(248, 248, 248, 1)),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                color: const Color.fromRGBO(152, 152, 152, 1),
                                width: 50,
                                height: 1,
                              ),
                              const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                  'Or sign in with',
                                  style: TextStyle(
                                      color: Color.fromRGBO(152, 152, 152, 1)),
                                ),
                              ),
                              Container(
                                color: const Color.fromRGBO(152, 152, 152, 1),
                                height: 1,
                                width: 50,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: 340,
                          height: 52,
                          child: FloatingActionButton(
                            onPressed: () {},
                            backgroundColor:
                                const Color.fromRGBO(245, 245, 245, 1),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  'assets/IconGoogle.png',
                                  width: 20,
                                  height: 19,
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                const Text(
                                  'Continue with Google',
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                      color: Color.fromRGBO(50, 41, 51, 1)),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: 340,
                          height: 52,
                          child: FloatingActionButton(
                            onPressed: () {},
                            backgroundColor:
                                const Color.fromRGBO(245, 245, 245, 1),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  'assets/logos_facebook.png',
                                  width: 20,
                                  height: 19,
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                const Text(
                                  'Continue with Facebook',
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                      color: Color.fromRGBO(50, 41, 51, 1)),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {},
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Don’t have an acoount ?',
                        style: TextStyle(fontWeight: FontWeight.w500)),
                    Text(
                      ' Register ',
                      style: TextStyle(fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
              )
            ],
          ),
        );
      }),
    );
  }
}
