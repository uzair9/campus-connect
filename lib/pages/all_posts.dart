import 'package:flutter/material.dart'; 
import 'package:campus_connect/db/local_db.dart'; 
import 'package:campus_connect/widgets/card_widget.dart';

class AllPosts extends StatelessWidget {
	const AllPosts({ 
		Key? key, 
		required this.postType,
	}) : super(key: key);
	
	final postType;

	@override
	Widget build(BuildContext context) {
		if (postType != 'hashtags') {
			return(Scaffold(
				body: SingleChildScrollView(
					child: Padding(
						padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
						child: Wrap(
							direction: Axis.horizontal,
							children: database['campusConnect'][postType].map<Widget>( (item) => 
								CustomCard( title: item['title'], body: item['body'], author: item['author'], agree: 0, disagree: 0, date: item['date'], postType: postType, )).toList()
						),
					),
				),
			));
		}
		return(Scaffold(
			body: SingleChildScrollView(
				child: Padding(
					padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
					child: Wrap(
						direction: Axis.horizontal,
						children: database['campusConnect'][postType].map<Widget>( (item) => 
							CustomCard( title: item['title'], body: item['body'], author: item['author'], date: item['date'], agree: item['agree'], disagree: item['disagree'], postType: postType, )).toList()
					),
				),
			),
		));
	} 
}
