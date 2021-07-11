import 'package:flutter/material.dart'; 

class CustomCard extends StatelessWidget {
  const CustomCard({
    Key? key,
    required this.title, required this.body,
    required this.author, required this.date,
  }) : super(key: key);

  final String title, body, author, date;

  @override
  Widget build(BuildContext context) {
		return Padding(
			padding: const EdgeInsets.fromLTRB(10, 10, 10, 0.0),
			child: (Card(
				child: Padding(
					padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
					child: Column(
						crossAxisAlignment: CrossAxisAlignment.stretch,
						children: [
							Text('$title \n'), 
							Text('$author \n'), 
							Text('$date \n'), 
						],
					),
				)
			)),
		);
	}
}
