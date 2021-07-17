import 'package:flutter/material.dart';
import 'package:campus_connect/db/local_db.dart'; 
import 'package:campus_connect/db/sessions.dart';
import 'dart:math';

class NewPost extends StatelessWidget {
	const NewPost({ Key? key }) : super(key: key);
	
	@override
	Widget build(BuildContext context) {
		
		Map args = ModalRoute.of(context)!.settings.arguments as Map; // the information about the type of post (out of 4 possibities) is here
		String date = DateTime.now().toString();
		
		/*
			Now, this is important. Take a look at the newData
			Map down below. We are storing 
			1. reactedBy[] array
			2. id 
			3. agree
			4. disagree
			fields down below. Though we need these fields only in case of a hashtag, 
			but still we keep them in all other as well (news, events, announcements)
			to avoid errors like: 

			Error Message: "Map<String, String> expected but got Map<String, Object>"
			or the other way around

			So, the bottom line is, do not change the newData Map
		*/
		
		Map<String, Object> newData = {
			'id': Random().nextInt(1000000000) + 0,
			'title': '',
			'body': '',
			'author': '${ database['campusConnect']['enrolledStudents'][activeUser['campusID']]['firstName'] } ${ database['campusConnect']['enrolledStudents'][activeUser['campusID']]['lastName'] }', 
			'date': date.substring(0, date.indexOf(' ')),
			'agree': 0,
			'disagree': 0,
			'reactedBy': []
		};
		
		String dbFieldToUpdate = 
		args['postType'] == 'News' ? 'news' : 
		args['postType'] == 'Events' ? 'events' :
		args['postType'] == 'Announcements' ? 'announcements' :
		args['postType'] == '#HashTags' ? 'hashtags' : '';

		final formKey = GlobalKey<FormState>();
		
		return (Scaffold(
			body: SafeArea(
				child: SingleChildScrollView(
					child: Stack(
						children: [
							IconButton(
								onPressed: () => Navigator.pop(context), 
								icon: const Icon(Icons.arrow_back_ios)
							),
							const SizedBox(height: 20),
							Padding(
								padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 20),
								child: Center(
									child: Column(
										children: [
											Text('Add New ${ args['postType'] } Here'), 

											Form(
												key: formKey,
												child: Column(
													children: [
														TextFormField(
															decoration: const InputDecoration(
																hintText: 'Add Title', 
															),
															
															/*
																This validator ( and the one down below ) gets called
																when you press the "tick" floating action button to submit
																the new post
															*/
															
															validator: (String? value) {
																if (value == null || value.isEmpty ) {
																	return('You Must Add a Title for Your ${ args['postType'] }');
																}
																newData['title'] = value;
															},
														),
														TextFormField(
															keyboardType: TextInputType.multiline,
														maxLines: 10,
															decoration: const InputDecoration(
																hintText: 'Add Details', 
															),
															validator: (String? value) {
																if (value == null || value.isEmpty ) {
																	return('You Must Add Text Body for Your ${ args['postType'] }');
																}
																newData['body'] = value;
															},
														)
													],
												)
											)
										]
									),
								),
							),
						],
					),
				)
			), 
			floatingActionButton: FloatingActionButton(
				onPressed: () {
					if (formKey.currentState!.validate()) {
						database['campusConnect'][dbFieldToUpdate].insert(0, newData);
						Navigator.pushReplacementNamed(context, '/home');
					}
				},
				child: const Icon(
					Icons.done,
					size: 36,
				)
			),
		));
	}
}
