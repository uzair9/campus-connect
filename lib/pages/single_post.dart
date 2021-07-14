import 'package:flutter/material.dart'; 

class SingleNews extends StatelessWidget {
	const SingleNews({ Key? key }) : super(key: key);

	@override
	Widget build(BuildContext context) {
		var args = ModalRoute.of(context)!.settings.arguments as Map;

		return Scaffold(
			body: SingleChildScrollView(
				child: SafeArea(
					child: Stack(
						children: [
							IconButton(
								icon: const Icon(Icons.arrow_back_ios),
								onPressed: () => Navigator.pop(context),
							),
							Padding(
								padding: EdgeInsets.fromLTRB(30, MediaQuery.of(context).size.width * 0.16, 30, 0.0),
								child: Center(
									child: Column(
										children: [ 
											Text('${args['title']} \n', 
												style: TextStyle(
													fontSize: 20, 
													fontWeight: FontWeight.bold, 
													color: Colors.blue[600]
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
											Text('${args['body']} \n', 
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
