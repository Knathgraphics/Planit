import 'package:flutter/material.dart';
import 'package:plarnit/util.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
            padding: EdgeInsets.all(50),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text(
                'Sign Up in Minutes 🤞',
                style: TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.w600,
                    color: Colors.black54),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Create an Account to Manage your Daily Tasks',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: Grey,
                ),
              ),
              Divider(
                height: 40,
                thickness: 1.5,
              ),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      cursorColor: Grey,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.account_circle_rounded),
                        prefixIconColor: Colors.amber,
                        labelText: 'Organization\'s Name',
                        labelStyle: TextStyle(color: Colors.black),
                        filled: false,
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Field cannot be Empty';
                        }
                      },
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    TextFormField(
                      cursorColor: Grey,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.email),
                        prefixIconColor: Colors.amber,
                        labelText: 'Email Address',
                        labelStyle: TextStyle(color: Colors.black),
                        filled: false,
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Email cannot be Empty';
                        }
                      },
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.number,
                      cursorColor: Grey,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.phone_android),
                        prefixIconColor: Colors.amber,
                        labelText: 'Phone Number',
                        labelStyle: TextStyle(color: Colors.black),
                        filled: false,
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Phone Number cannot be Empty';
                        }
                      },
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(1),
                margin: EdgeInsets.symmetric(vertical: 30),
                height: 55,
                  width: MediaQuery.of(context).size.width,
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(backgroundColor: Yellow, foregroundColor: Colors.black),
                      onPressed: () {
                      if(_formKey.currentState!.validate()){
                        print('Validated');
                        //final Snack = SnackBar(content: Text('Registration Successful'));
                      }
                      },
                      icon: Icon(Icons.arrow_forward),
                      label: Text('Sign Up'))),
            ])));
  }
}
