import 'package:flutter/material.dart'; 
import 'package:campus_connect/pages/home.dart';
import 'package:campus_connect/pages/signin.dart';
import 'package:campus_connect/pages/my_account.dart';
import 'package:campus_connect/pages/about_us.dart';
import 'package:campus_connect/pages/splash.dart';
import 'package:campus_connect/pages/single_post.dart';
import 'package:campus_connect/pages/new_post.dart';

void main() => runApp(MaterialApp( 
	// initialRoute: '/home',
	routes: {
		'/': (context) => const Splash(), 
		'/signin': (context) => const SignIn(), 
		'/home': (context) => const Home(),
		'/account': (context) => const Account(),
		'/about': (context) => const About(),
		'/singleNews': (context) => const SingleNews(),
		'/newPost': (context) => const NewPost(),
	},
));
