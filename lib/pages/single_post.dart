import 'package:flutter/material.dart'; 

/*
	This screens handles what you see when
	you click on any news or event and you go to the next
	screen to see the details of it

	We pass title, author, date and body of the card here. 
	All that is then shown here to the users

	Also, we have created a back button that allows us to pop this screen
	without using a top app bar. When you don't use a top app bar, you have to 
	wrap things in a SafeArea( ... ) widget, so that nothing goes up and up
	the screen and things appear decent and gets pulled down a little from the top
*/

class SinglePost extends StatelessWidget {
	const SinglePost({ Key? key }) : super(key: key);

	@override
	Widget build(BuildContext context) {
		
		var args = ModalRoute.of(context)!.settings.arguments as Map;
		// type casting them to Map from object so that we can [] to access nested elements
		
		return Scaffold(
			body: SingleChildScrollView( // lets us scroll without losing data
				child: SafeArea(
					child: Stack(
						children: [
							IconButton(
								icon: const Icon(Icons.arrow_back_ios),
								onPressed: () => Navigator.pop(context),
							),
							Padding(
								padding: EdgeInsets.fromLTRB(30, MediaQuery.of(context).size.width * 0.16, 30, 0.0), // for relative padding according to screen size (not absolute padding)
								child: Center(
									child: Column(
										children: [ 
											Text('${args['title']} \n', 
												style: const TextStyle(
													fontSize: 20, 
													fontWeight: FontWeight.bold, 
													// color: Colors.blue[600]
												)
											), 
											Text('${args['author']} \n', 
												style: const TextStyle(
													fontSize: 14, 
													fontWeight: FontWeight.bold
												)
											),
											Text('${args['date']} \n', 
												style: const TextStyle(
													fontSize: 14, 
													fontWeight: FontWeight.bold
												)
											),
											SelectableText('${args['body']} \n', 
												style: const TextStyle(
													wordSpacing: 2,
													fontSize: 17
												)
											)
										]
									),
								),
							)
						],
					),
				),
			)
		);
	}
}
