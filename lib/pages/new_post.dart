import 'package:flutter/material.dart';
import 'package:campus_connect/db/local_db.dart'; 
import 'package:campus_connect/db/sessions.dart';

class NewPost extends StatelessWidget {
	const NewPost({ Key? key }) : super(key: key);
	
	@override
	Widget build(BuildContext context) {
		
		Map args = ModalRoute.of(context)!.settings.arguments as Map;
		String date = DateTime.now().toString();
		Map<String, Object> newData = {
			'title': '',
			'body': '',
			'author': '${ database['campusConnect']['enrolledStudents'][activeUser['campusID']]['firstName'] } ${ database['campusConnect']['enrolledStudents'][activeUser['campusID']]['lastName'] }', 
			'date': date.substring(0, date.indexOf(' ')),
		};

		if (args['postType'] == '#HashTags') {
			newData = {
				'title': '',
				'body': '',
				'author': '${ database['campusConnect']['enrolledStudents'][activeUser['campusID']]['firstName'] } ${ database['campusConnect']['enrolledStudents'][activeUser['campusID']]['lastName'] }', 
				'date': date.substring(0, date.indexOf(' ')),
				'agree': 0,
				'disagree': 0, 
				'reactedBy': []
			};
		}
		
		String dbFieldToUpdate = 
		args['postType'] == 'News' ? 'news' : 
		args['postType'] == 'Events' ? 'events' :
		args['postType'] == 'Announcements' ? 'announcements' :
		args['postType'] == '#HashTags' ? 'hashtags' : '';

		final formKey = GlobalKey<FormState>();
		
		return(Scaffold(
			body: SafeArea(
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
