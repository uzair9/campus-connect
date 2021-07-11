import 'package:flutter/material.dart'; 

class About extends StatelessWidget {
	const About({ Key? key }) : super(key: key);

	@override
	Widget build(BuildContext context) {
		return(Scaffold(
			appBar: AppBar(
				title: const Text('About Us')
			),
			body: const Center(
				child: Text('Uzair Afzal developed this application from scratch')
			)
		));
	}
}
