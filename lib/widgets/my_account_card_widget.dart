import 'package:flutter/material.dart';

class MyCard extends StatelessWidget {
  const MyCard({
    Key? key,
    required this.tileTile,
    required this.tileSubtitle,
		required this.icon
  }) : super(key: key);

  final String tileTile;
  final String tileSubtitle;
	final Icon icon;

  @override
  Widget build(BuildContext context) {
		return Column(
			children: [
				Card(
					elevation: 4,
					child: ListTile(
						leading: icon,
						title: Text(tileTile, 
							style: const TextStyle(
								color: Colors.black, 
								fontWeight: FontWeight.bold, 
								fontSize: 18
							)
						),
						subtitle: Padding(
							padding: const EdgeInsets.only(top: 1),
							child: Text(tileSubtitle, 
								style: TextStyle(
									color: Colors.grey[700]
								)
							),
						),
					),
				), 
				const SizedBox(height: 10)
			],
		);
	}
}
