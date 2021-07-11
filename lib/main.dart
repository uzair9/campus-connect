import 'package:flutter/material.dart'; 
import 'package:campus_connect/pages/home.dart';
import 'package:campus_connect/pages/signin.dart';

void main() => runApp(MaterialApp( 
	// initialRoute: '/home',
	routes: {
		'/': (context) => const SignIn(), 
		'/home': (context) => const Home()
	},
));
