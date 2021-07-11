import 'package:flutter/material.dart'; 

class Announcements extends StatelessWidget {
	const Announcements({ Key? key }) : super(key: key);

	@override
	Widget build(BuildContext context) {
		return(const Scaffold(
			body: Center(
				child: Text('Announcements')
			),
		)
		);
	}
}
