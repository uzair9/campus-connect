import 'package:flutter/material.dart'; 

class CustomCard extends StatelessWidget {
  
	const CustomCard({
    Key? key,
    required this.title, required this.body,
    required this.author, required this.date,
		required this.postType, required this.agree, 
		required this.disagree
  }) : super(key: key);

  final String title, body, author, date, postType;
	final int agree, disagree;

  @override
  Widget build(BuildContext context) {
		if (postType != 'hashtags') {
			return Padding(
				padding: const EdgeInsets.fromLTRB(10, 10, 10, 0.0),
				child: (Card(
					child: Padding(
						padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
						child: Column(
							crossAxisAlignment: CrossAxisAlignment.stretch,
							children: [ 
								TextButton(
									onPressed: () => Navigator.pushNamed(context, '/singleNews', arguments: {
										'title': title, 
										'date': date, 
										'author': author, 
										'body': body
									}), 
									child: Text('$title \n'),
								),
								Text('$author \n'), 
								Text('$date \n'),
							],
						),
					),
				)),
			);
		}
		else if (postType == 'hashtags') {
			return Padding(
				padding: const EdgeInsets.fromLTRB(10, 10, 10, 0.0),
				child: (Card(
					child: Padding(
						padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
						child: Column(
							crossAxisAlignment: CrossAxisAlignment.stretch,
							children: [ 
								TextButton(
									onPressed: () => Navigator.pushNamed(context, '/singleNews', arguments: {
										'title': title, 
										'date': date, 
										'author': author, 
										'body': body
									}), 
									child: Text('$title \n'),
								),
								Text('$author \n'), 
								Text('$date \n'),
								Row(
									mainAxisAlignment: MainAxisAlignment.center,
									children: [
										Row(
											children: [
												const Icon(Icons.thumb_up, color: Colors.green,),
												const SizedBox(width: 10.0),
												Text('$agree'), 
											],
										),
										const SizedBox(width: 15.0),
										Row(
											children: [
												const Icon(Icons.thumb_down, color: Colors.red), 
												const SizedBox(width: 10.0),
												Text('$disagree')
											],
										),
									],
								)
							],
						),
					),
				)),
			);
		}
		return Container();
	}
}
