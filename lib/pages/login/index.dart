// ignore_for_file: must_be_immutable

import 'dart:ui';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:lzh/utils/colorUtils.dart';
// 封装组件
import 'package:lzh/widget/MyAppBar.dart';

class Login extends StatelessWidget {
  TextEditingController _textEditingController = TextEditingController();
  Login({super.key});
  Color backgroundColor = Colors.red;

  @override
  Widget build(BuildContext context) {
    // bool isDarkMode(BuildContext context) {}

    print(Theme.of(context).colorScheme.brightness == Brightness.dark);

   //print(Theme.of(context).accentColor);
    return Scaffold(
      // appBar:
      body: Container(
        // margin:EdgeInsets.only(top: MediaQueryData.fromWindow(window).padding.top),
        // alignment: Alignment.center,
        child: Column(
          children: [
            MyAppBar(
              fromHeight: 20,
              title: Text(
                "登入",
                style: TextStyle(fontSize: 14, color: Colors.black),
              ),
              actions: [
                Container(
                    margin: EdgeInsets.only(right: 20.w),
                    alignment: Alignment.center,
                    child: Text(
                      "注册账号",
                      style: TextStyle(fontSize: 14, color: ColorUtils.sysColorText(context)),
                    ))
              ],
              backgroundColor: ColorUtils.sysColorBag(context) ,
              elevation: 10,
            ),
            LoginForm()
          ],
        ),
      ),
    );
  }
}

class LoginForm extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  LoginForm({super.key});
  void _submitForm() {
    print("xxxx");
    final isValid = _formKey.currentState?.validate() ?? false;
    if (!isValid) {
      return;
    }
    var username = _usernameController.value;
    var password = _usernameController.value;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(left: 10.w, right: 10.w),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                controller: _usernameController,
                decoration: InputDecoration(labelText: '账号', hintText: "手机号"),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your username';
                  }
                  RegExp phoneRegExp = new RegExp(r'^1[3456789]\d{9}$');

                  if (!phoneRegExp.hasMatch(value)) {
                    return '手机号不合法';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _passwordController,
                decoration: InputDecoration(labelText: '密码'),
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return '';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              ElevatedButton(
                child: Text('登入'),
                onPressed: _submitForm,
              ),
            ],
          ),
        ));
  }
}
