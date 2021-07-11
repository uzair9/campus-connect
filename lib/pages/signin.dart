import 'package:flutter/material.dart';
import 'package:campus_connect/db/local_db.dart';

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
							const CircleAvatar(
								radius: 100,
							),
							const SizedBox(height: 10.0,),
							TextFormField(
								decoration: const InputDecoration(
									hintText: 'Enter LUMS ID'
								), 
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
										Navigator.pushReplacementNamed(context, '/home', arguments: {
											'userID': campusID
										})
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
