import 'package:flutter/material.dart'; 
import 'package:campus_connect/pages/home.dart';
import 'package:campus_connect/pages/signin.dart';
import 'package:campus_connect/pages/my_account.dart';
import 'package:campus_connect/pages/about_us.dart';

void main() => runApp(MaterialApp( 
	// initialRoute: '/home',
	routes: {
		'/': (context) => const SignIn(), 
		'/home': (context) => const Home(),
		'/account': (context) => const Account(),
		'/about': (context) => const About(),
	},
));
