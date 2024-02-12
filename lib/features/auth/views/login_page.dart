import 'package:flutter/material.dart';
import 'package:mentor_program/features/home/views/home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey=GlobalKey<FormState>();
  bool _obscureText=true;
  @override
  Widget build(BuildContext context) {
    return Form(
     key: _formKey,
      child: Scaffold(
        extendBodyBehindAppBar: true,
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          scrolledUnderElevation: 0,
          elevation: 0,
        ),
        body: SafeArea(child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                     'Welcome back!',
                              style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                                fontWeight: FontWeight.bold
                              ),
                            ),
                            SizedBox(height: 20,),
                             Text('Email',
                            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                                fontWeight: FontWeight.bold
                              ),
                            ),
                            SizedBox(height: 5,),
                        TextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter email';
                              } else if (!RegExp(
                                      r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$')
                                  .hasMatch(value)) {
                                return 'Please enter a valid email address';
                              }
                              return null;
                            },
                            controller: _emailController,
                            decoration: const InputDecoration(
                              //border: OutlineInputBorder(),
                              hintText: 'Enter your email',
                            ),
                          ),
                         
                        
                        const SizedBox(height: 10),
                         Text('Password',
                            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                                fontWeight: FontWeight.bold
                              ),
                            ),
                          TextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter a password';
                              }
                              return null;
                            },
                            obscureText: _obscureText,
                            controller: _passwordController,
                            decoration: InputDecoration(
                              hintText: 'Enter your password',
                              suffixIcon: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      _obscureText = !_obscureText;
                                    });
                                  },
                                  child: Icon(
                                    _obscureText
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                  )),
                            ),
                          ),
                        SizedBox(height: 30,),
                         ElevatedButton(onPressed: (){
                            if(_formKey.currentState!.validate()){
                             Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>HomePage()));
                            }
                           
                      }, child:  Text('Login',
                                    style: Theme.of(context).textTheme.titleSmall!.copyWith(
              
                                    fontWeight: FontWeight.bold)
                                    ),
                                    style: ElevatedButton.styleFrom(
                                      minimumSize: Size(double.infinity, 40),
                                      backgroundColor: Theme.of(context).colorScheme.primary,
                                      shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)
                                      )
                                    ),
                                    ),
            ],
          ),
        )),
      ),
    );
  }
}