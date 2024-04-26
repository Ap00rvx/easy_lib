import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:easy_lib/res/common/app_colors.dart';
import 'package:easy_lib/src/features/authentication/bloc/login_bloc/login_bloc.dart';
import 'package:easy_lib/src/features/home/view/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final idController = TextEditingController();
  final passwordController =TextEditingController();
  final _key = GlobalKey<FormState>();
  bool _obscure =true ;
  bool _value  =false;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: BlocListener<LoginBloc,LoginState>(
              listener: (BuildContext context, LoginState state) {  
                if (state is LoginErrorState){
                  final snackBar = SnackBar(
                    elevation: 0,
                    behavior: SnackBarBehavior.floating,
                    backgroundColor: Colors.transparent,
                    content: AwesomeSnackbarContent(
                      title: 'On Snap!',
                      message:
                      state.err,
                      contentType: ContentType.failure,
                    ),
                  );

                  ScaffoldMessenger.of(context)
                    ..hideCurrentSnackBar()
                    ..showSnackBar(snackBar);
                }
                else if (state is LogInSuccessState){
                  final snackBar = SnackBar(
                    elevation: 0,
                    behavior: SnackBarBehavior.floating,
                    backgroundColor: Colors.transparent,
                    content: AwesomeSnackbarContent(
                      title: 'Wooh hoohh!',
                      message:
                      "Login Success, Welcome Back!",
                      contentType: ContentType.success,
                    ),
                  );

                  ScaffoldMessenger.of(context)
                    ..hideCurrentSnackBar()
                    ..showSnackBar(snackBar);

                  Future.delayed(const Duration(seconds: 2),(){
                    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => Home(token: state.token)), (route) => false) ;
                  });
                }
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  Image.asset('assets/images/elogo.png',height: 150,width: 150,),
                  Form(key: _key,
                      child:Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 30,
                            ),
                        TextFormField(
                          controller: idController,
                          keyboardType: TextInputType.number,

                          decoration: InputDecoration(
                            labelText: 'College ID',
                            focusColor: AppColors.positive,
                            suffixIcon: const Icon(Icons.person),
                            labelStyle:const TextStyle(
                              color: AppColors.black
                            ),
                            hintText: "Enter ID provided by your Organisation",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15)
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                color: AppColors.positive
                              )
                            )
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          obscureText: _obscure,
                          controller: passwordController,
                          decoration: InputDecoration(
                              labelText: 'Password',
                              suffixIcon: IconButton(onPressed: (){
                                setState(() {
                                  _obscure = !_obscure;
                                });
                              },icon: Icon(Icons.remove_red_eye,color: _obscure ?AppColors.black:AppColors.positive ,),),
                              labelStyle:const TextStyle(
                                  color: AppColors.black
                              ),
                              hintText: "Enter Password",
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15)
                              ),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: const BorderSide(
                                      color: AppColors.positive
                                  )
                              )
                          ),
                        ),
                            const SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  child: Row(
                                    children: [
                                      Checkbox(value:_value,checkColor: AppColors.black,activeColor:AppColors.positive,onChanged: (val){
                                        setState(() {
                                          _value =val!  ;
                                        });
                                      }),
                                      const Text("Remember me")
                                    ],
                                  ),
                                ),
                                TextButton(onPressed: (){}, child:  const Text("Forgot Password",style: TextStyle(
                                  color: Colors.blue,
                                  decoration: TextDecoration.underline,
                                  decorationColor: Colors.blue
                                ),))
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            ElevatedButton(onPressed: (){
                              BlocProvider.of<LoginBloc>(context).add(GetUserLoggedIn(uid: idController.text, password:passwordController.text,remember:_value));
                            },style: ElevatedButton.styleFrom(
                              fixedSize: const Size(500, 50),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)
                              ),
                              backgroundColor: AppColors.positive,
                              foregroundColor: AppColors.black,

                            ), child:  BlocBuilder<LoginBloc,LoginState>(
                              builder: (context,state ) {
                                if(state is  LoginLoadingState){
                                  return const CircularProgressIndicator(
                                    color: AppColors.base,
                                  );
                                }
                                else {
                                  return const Text("Submit",style: TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.w600
                                  ),);
                                }
                              }
                            ),),
                            const SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text("New User?"),
                                TextButton(onPressed: (){}, child:  const Text("Register",style: TextStyle(
                                    color: Colors.blue,
                                    decoration: TextDecoration.underline,
                                    decorationColor: Colors.blue
                                ),))
                              ],
                            )
                          ],
                        ),
                      ))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
