import 'package:flutter/material.dart';
import 'package:campus_connect/db/local_db.dart';
import 'package:campus_connect/db/sessions.dart'; 

/*
	The form is a very basic flutter form. 
	Validator() function does validation for the form input fields 

	We also set sessions (to keep track of an active user) in this file. 
	We need this user's info in case they make a new post in the application

	Notice that when we go to home, we replace this screen, i.e., you cannot come
	back to this screen by pressing the "back" button from home screen
*/

class SignIn extends StatefulWidget {
	const SignIn({ Key? key }) : super(key: key);

	@override
	_SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
	final GlobalKey<FormState> formKey = GlobalKey<FormState>();
	var campusID = '';
	var password = '';
	
	@override
	Widget build(BuildContext context) {
		return(Scaffold(
			body: Form(
				key: formKey, 
				child: Padding(
					padding: const EdgeInsets.fromLTRB(20.0, 0, 20.0, 100.0),
					child: Column(
						mainAxisAlignment: MainAxisAlignment.center,
						children: [
							CircleAvatar(
								backgroundImage: const AssetImage('assets/images/logo.png'),
								radius: MediaQuery.of(context).size.width * 0.30,
								backgroundColor: Colors.transparent,
							),
							const SizedBox(height: 20.0),
							Text('Campus Connect Sign In', 
								style: TextStyle(
									fontSize: 27, 
									fontWeight: FontWeight.bold, 
									color: Colors.blue[600]
								),
							),
							const SizedBox(height: 20.0),
							TextFormField(
								decoration: const InputDecoration(
									hintText: 'Enter LUMS ID'
								), 
								
								/*
									Notice the submit button at the bottom of the form. 
									When we press the submit button, both the validators
									get called one after another
								*/
								
								validator: (String? id) {
									if (id == null || id.isEmpty) {
										return('LUMS ID is Required');
									}
									if (id.length != 8) {
										return('LUMS ID Should Be 8 Characters Long');
									}
									if (!database['campusConnect']['enrolledStudents'].containsKey(id)) {
										return('Not a Valid LUMS ID');
									}
									campusID = id;
								},
							),
							const SizedBox(height: 10.0), 
							TextFormField(
								decoration: const InputDecoration(
									hintText: 'Enter LUMS Password'
								), 
								validator: (String? pass) {
									if (pass == null || pass.isEmpty) {
										return('LUMS Password is Required');
									}
									if (database['campusConnect']['enrolledStudents'][campusID]['password'] != pass) {
										return('Password is Incorrect');
									}
									password = pass;
								},
							),
							const SizedBox(height: 20), 
							ElevatedButton(
								onPressed: () => {
									if (formKey.currentState!.validate()) {
										activeUser['campusID'] = campusID,
										activeUser['firstName'] = database['campusConnect']['enrolledStudents'][campusID]['firstName'],
										activeUser['lastName'] = database['campusConnect']['enrolledStudents'][campusID]['lastName'],
										
										Navigator.pushReplacementNamed(context, '/home')
									}
								},
								child: const Text('Continue')
							)
						],
					),
				)
			)
		));
	}
}
