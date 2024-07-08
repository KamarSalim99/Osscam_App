import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_state_mangment/model/request/login_user_model.dart';
import 'package:project_state_mangment/view/signup_page.dart';
import 'package:project_state_mangment/view_model/login/bloc/login_bloc.dart';
import 'package:project_state_mangment/view_model/login/bloc/login_state.dart';

import '../core/constans/app_string.dart';
import '../core/config/resources/app_colors.dart';
import '../core/config/resources/app_styles.dart';
import '../core/widgets/app_widgets.dart';
import '../view_model/login/bloc/login_event.dart';
import 'creat_or_join_page.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      color: backgroundColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Stack(
            alignment: Alignment.topCenter,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  top: 70,
                ),
                child: containerBox(
                  width: 288,
                  height: 360,
                  columnOfTextFiald: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      buildTextFialdWithLabel(
                          label: 'Email',
                          hint: 'Example@gmail.com',
                          textInputType: TextInputType.emailAddress,
                          controller: email),
                      buildTextFialdWithLabel(
                          label: 'Password',
                          hint: 'Password',
                          textInputType: TextInputType.visiblePassword,
                          controller: password),
                    ],
                  ),
                ),
              ),
              Positioned(
                  top: 1, child: Image.asset('assets/images/mastury.png')),
            ],
          ),
          BlocProvider(
            create: (context) => LoginBloc(),
            child: BlocConsumer<LoginBloc, LoginState>(
              listener: (context, state) {
                if (state is ErrorState) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text("Login is Fiald, Please Try again"),
                    backgroundColor: Colors.red,
                  ));
                }
              },
              builder: (context, state) {
                if (state is LoginInialState) {
                  return ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: secondry,
                      alignment: Alignment.center,
                    ),
                    onPressed: () {
                      context.read<LoginBloc>().add(SendDataEvent(
                          user: LoginUserModel(
                              email: email.text, password: password.text)));
                    },
                    child: Text(
                      LOGIN,
                      style: TextButtonTextStyle,
                    ),
                  );
                } else if (state is SuccessState) {
                  WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CreatOrJoinPage(),
                        ));
                  });
                } else if (state is ErrorState) {
                  return ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: secondry,
                        alignment: Alignment.center,
                      ),
                      onPressed: () {
                        context.read<LoginBloc>().add(SendDataEvent(
                            user: LoginUserModel(
                                email: email.text, password: password.text)));
                      },
                      child: Text(
                        LOGIN,
                        style: TextButtonTextStyle,
                      ));
                } else {
                  return CupertinoActivityIndicator(
                    color: secondry,
                  );
                }
                return SizedBox();
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(SwichToLoginText, style: SwichLoginTextStyle),
              TextButton(
                onPressed: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SignupPage())),
                child: Text(
                  SIGNUP,
                  style: LoginSignupTextTextStyle,
                ),
              )
            ],
          )
        ],
      ),
    ));
  }
}
