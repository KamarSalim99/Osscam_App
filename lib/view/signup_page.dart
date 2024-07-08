import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_state_mangment/model/request/signup_user_model.dart';
import 'package:project_state_mangment/view/creat_or_join_page.dart';
import 'package:project_state_mangment/view/login_page.dart';
import 'package:project_state_mangment/view_model/signup/bloc/signup_bloc.dart';
import 'package:project_state_mangment/view_model/signup/bloc/signup_event.dart';
import 'package:project_state_mangment/view_model/signup/bloc/signup_state.dart';
import '../core/constans/app_string.dart';
import '../core/config/resources/app_colors.dart';
import '../core/config/resources/app_styles.dart';
import '../core/widgets/app_widgets.dart';

class SignupPage extends StatelessWidget {
  SignupPage({super.key});
  TextEditingController username = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      width: double.infinity,
      height: double.infinity,
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
                  height: 438,
                  columnOfTextFiald: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      buildTextFialdWithLabel(
                          label: 'Username',
                          hint: 'Example',
                          textInputType: TextInputType.name,
                          controller: username),
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
              create: (context) => SignupBloc(),
              child: BlocConsumer<SignupBloc, SignUpState>(
                listener: (context, state) {
                   if (state is ErrorState){
                       ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Sign Up is Fiald, Please Try again"),backgroundColor: Colors.red,));
                      }
                },
                builder: (context, state) {
                  if (state is SignUpInialState) {
                    return ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: secondry,
                        alignment: Alignment.center,
                      ),
                      onPressed: () {
                        context.read<SignupBloc>().add(SendDataEvent(
                            user: SignupUserModel(
                                firstName: username.text,
                                lastName: "sy",
                                email: email.text,
                                role: 'USER',
                                password: password.text)));
                      },
                      child: Text(
                        SIGNUP,
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
                          context.read<SignupBloc>().add(SendDataEvent(
                              user: SignupUserModel(
                                  firstName: username.text,
                                  lastName: "sy",
                                  email: email.text,
                                  role: 'USER',
                                  password: password.text)));
                        },
                        child: Text(
                          SIGNUP,
                          style: TextButtonTextStyle,
                        ));
                  } else {
                    return CupertinoActivityIndicator(
                      color: secondry,
                    );
                  }
                  return SizedBox();
                },
              )),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(SwichToLoginText, style: SwichLoginTextStyle),
              TextButton(
                onPressed: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => LoginPage())),
                child: Text(
                  LOGIN,
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
