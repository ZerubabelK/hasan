import 'package:driver_app/screen/home.dart';
import 'package:driver_app/utils/colors.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String? errorMessage = '';
  bool isLogin = true;

  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();

  Widget _errorMessage() {
    return Text(errorMessage == '' ? '' : 'Humm ? $errorMessage');
  }

  Widget _submitButton() {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.8,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: yellow,
          onPrimary: black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        onPressed: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const HomePage()),
          );
        },
        child: Text(isLogin ? 'Login' : 'Register'),
      ),
    );
  }

  Widget _loginOrRegistrationButton() {
    return TextButton(
      onPressed: () {
        setState(() {
          isLogin = !isLogin;
        });
      },
      child: Text(
        isLogin
            ? "Don't have an account? Register"
            : "Do u have an account? Login",
        style:
            TextStyle(color: yellow, fontSize: 14, fontFamily: 'Poppins-Light'),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: black,
      body: SingleChildScrollView(
        child: isLogin
            ? Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.35,
                  ),
                  const Text(
                    "Driver App",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                      color: yellow,
                      fontFamily: 'Poppins-Bold',
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Padding(
                      padding: const EdgeInsets.fromLTRB(40, 5, 40, 5),
                      child: TextFormField(
                        validator: (Value) {
                          if (Value == null || Value.isEmpty) {
                            return "email cannot be empty";
                          }
                          return null;
                        },
                        style: TextStyle(
                          color: white,
                          fontFamily: 'Poppins-Light',
                        ),
                        controller: _controllerEmail,
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.all(6),
                          hintText: 'email',
                          hintStyle: TextStyle(
                            color: Colors.grey,
                            fontSize: 14,
                            fontFamily: 'Poppins-Light',
                          ),
                          prefixIcon: Icon(
                            Icons.email,
                            color: Colors.grey,
                          ),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: grey, width: 1),
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              )),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.white,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.all(
                              Radius.circular(4),
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: yellow,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                        ),
                      )),
                  Padding(
                      padding: const EdgeInsets.fromLTRB(40, 5, 40, 5),
                      child: TextFormField(
                        validator: (Value) {
                          if (Value == null || Value.isEmpty) {
                            return "password cannot be empty";
                          }
                          return null;
                        },
                        obscureText: true,
                        style: const TextStyle(
                          color: Colors.white,
                          fontFamily: 'Poppins-Light',
                        ),
                        controller: _controllerPassword,
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.all(6),
                          hintText: 'password',
                          hintStyle: TextStyle(
                            color: Colors.grey,
                            fontFamily: 'Poppins-Light',
                            fontSize: 14,
                          ),
                          prefixIcon: Icon(
                            Icons.key,
                            color: Colors.grey,
                          ),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: grey, width: 1),
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              )),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.white,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.all(
                              Radius.circular(4),
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: yellow,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                        ),
                      )),
                  const SizedBox(
                    height: 20,
                  ),
                  Center(child: _submitButton()),
                  const SizedBox(
                    height: 10,
                  ),
                  const Center(
                    child: Text(
                      "OR",
                      style: TextStyle(
                        color: white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Center(child: _loginOrRegistrationButton()),
                  Center(child: _errorMessage()),
                ],
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.2,
                  ),
                  const Text(
                    "Driver Registration",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                      color: yellow,
                      fontFamily: 'Poppins-Bold',
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Padding(
                      padding: const EdgeInsets.fromLTRB(25, 5, 25, 5),
                      child: TextFormField(
                        // ignore: non_constant_identifier_names
                        validator: (Value) {
                          if (Value == null || Value.isEmpty) {
                            return "First Name cannot be empty";
                          } else if (Value.length < 3) {
                            return 'First Name must be more than 2 character';
                          }
                          return null;
                        },
                        style: const TextStyle(
                          color: white,
                          fontFamily: 'Poppins-Light',
                        ),
                        controller: firstNameController,
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.all(6),
                          hintText: 'FirstName',
                          hintStyle: TextStyle(
                            color: Colors.grey,
                            fontFamily: 'Poppins-Light',
                            fontSize: 14,
                          ),
                          prefixIcon: Icon(Icons.person, color: Colors.grey),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: grey, width: 1),
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: yellow,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                        ),
                      )),
                  Padding(
                      padding: const EdgeInsets.fromLTRB(25, 5, 25, 5),
                      child: TextFormField(
                        validator: (Value) {
                          if (Value == null || Value.isEmpty) {
                            return "Last Name cannot be empty";
                          }
                          return null;
                        },
                        style: const TextStyle(
                          color: white,
                          fontFamily: 'Poppins-Light',
                        ),
                        controller: lastNameController,
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.all(6),
                          hintText: 'LastName',
                          hintStyle: TextStyle(
                            color: Colors.grey,
                            fontFamily: 'Poppins-Light',
                            fontSize: 14,
                          ),
                          prefixIcon: Icon(Icons.person, color: Colors.grey),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: grey, width: 1),
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: yellow,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                        ),
                      )),
                  Padding(
                      padding: const EdgeInsets.fromLTRB(25, 5, 25, 5),
                      child: TextFormField(
                        validator: (Value) {
                          if (Value == null || Value.isEmpty) {
                            return "email cannot be empty";
                          }
                          return null;
                        },
                        style: const TextStyle(
                            color: white, fontFamily: 'Poppins-Light'),
                        controller: _controllerEmail,
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.all(6),
                          hintText: 'email',
                          hintStyle: TextStyle(
                            color: Colors.grey,
                            fontFamily: 'Poppins-Light',
                            fontSize: 14,
                          ),
                          prefixIcon: Icon(
                            Icons.email,
                            color: Colors.grey,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: grey, width: 1),
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: yellow,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                        ),
                      )),
                  Padding(
                      padding: const EdgeInsets.fromLTRB(25, 5, 25, 5),
                      child: TextFormField(
                        validator: (Value) {
                          if (Value == null || Value.isEmpty) {
                            return "password cannot be empty";
                          }
                          return null;
                        },
                        obscureText: true,
                        style: const TextStyle(
                          color: white,
                          fontFamily: 'Poppins-Light',
                        ),
                        controller: _controllerPassword,
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.all(6),
                          hintText: 'password',
                          hintStyle: TextStyle(
                            color: Colors.grey,
                            fontFamily: 'Poppins-Light',
                            fontSize: 14,
                          ),
                          prefixIcon: Icon(Icons.key, color: Colors.grey),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: grey, width: 1),
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: yellow,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                        ),
                      )),
                  Padding(
                      padding: const EdgeInsets.fromLTRB(25, 5, 25, 5),
                      child: TextFormField(
                        validator: (Value) {
                          if (Value == null || Value.isEmpty) {
                            return "password cannot be empty";
                          } else if (Value != _controllerPassword.text) {
                            return "password doesn't Match";
                          }
                          return null;
                        },
                        obscureText: true,
                        style: const TextStyle(
                          color: white,
                          fontFamily: 'Poppins-Light',
                        ),
                        controller: confirmPasswordController,
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.all(6),
                          hintText: 'ConfirmPassword',
                          hintStyle: TextStyle(
                            color: Colors.grey,
                            fontFamily: 'Poppins-Light',
                            fontSize: 14,
                          ),
                          prefixIcon: Icon(Icons.key, color: Colors.grey),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: grey, width: 1),
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              )),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: yellow,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                        ),
                      )),
                  const SizedBox(
                    height: 30,
                  ),
                  Center(child: _submitButton()),
                  const Center(
                    child: Text(
                      "OR",
                      style: TextStyle(
                        color: white,
                        fontSize: 14,
                        fontFamily: 'Poppins-Light',
                      ),
                    ),
                  ),
                  Center(child: _loginOrRegistrationButton()),
                  Center(child: _errorMessage()),
                ],
              ),
      ),
    );
  }
}
