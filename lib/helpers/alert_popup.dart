import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart'; // iOS library that Flutter uses
import 'package:campus_connect/db/sessions.dart';

void alertPopUp(String title, String msg, BuildContext context) {
	showDialog(
		context: context,
		builder: (BuildContext context) => CupertinoAlertDialog(
			title: Text(title), 
			content: Text(msg),
			actions: [
				CupertinoDialogAction(
					child: const Text('Yes'),
					onPressed: () => {
						activeUser['campusID'] = activeUser['firstName'] = activeUser['lastName'] = null,
						Navigator.pushReplacementNamed(context, '/signin')
					},
				), 
				CupertinoDialogAction(
					child: const Text('Cancel'), 
					onPressed: () => Navigator.pop(context),
				)
			],
		),
	);
}
