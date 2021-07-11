import 'package:flutter/material.dart'; 
import 'package:campus_connect/db/local_db.dart'; 
import 'package:campus_connect/widgets/card_widget.dart';

class News extends StatelessWidget {
	const News({ Key? key }) : super(key: key);

	@override
	Widget build(BuildContext context) {
		return(Scaffold(
			body: Column(
					children: database['campusConnect']['news'].map<Widget>( (item) => 
						CustomCard( title: item['title'], body: item['body'], author: item['author'], date: item['date'] )).toList()
				),
		));
	}
}
