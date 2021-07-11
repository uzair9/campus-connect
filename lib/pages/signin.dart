import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
	const SignIn({ Key? key }) : super(key: key);

	@override
	_SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
	final GlobalKey<FormState> formKey = GlobalKey<FormState>();
	dynamic campusID;
	dynamic password;
	
	Map database = {
		'22100031': {
			'pass': '123'
		}, 
		'22100032': {
			'pass': '123'
		}
	};
	
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
								validator: (String? ID) {
									if (ID == null || ID.isEmpty) {
										return('LUMS ID is Required');
									}
									if (ID.length != 8) {
										return('LUMS ID Should Be 8 Characters Long');
									}
									if (!database.containsKey(ID)) {
										return('Not a Valid LUMS ID');
									}
									campusID = ID;
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
									if (database[campusID]['pass'] != pass) {
										print(database[campusID]['pass']);
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
