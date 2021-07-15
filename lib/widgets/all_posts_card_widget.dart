import 'package:flutter/material.dart';
import 'package:campus_connect/helpers/thumbs_up_down.dart';

/*
	This widget builds that card for us which is being shown
	in all the tabs of the tab navigator

	Notice that we are conditionally returning code from here, i.e.,
	we return a different card for hashtags and a different card for all 
	others (news, events, announcements etc.)
*/

// ignore: must_be_immutable
class CustomCard extends StatefulWidget {
  
	CustomCard({
    Key? key,
    required this.title, required this.body,
    required this.author, required this.date,
		required this.postType, required this.agree, 
		required this.disagree, required this.hashTagId
  }) : super(key: key);

  String title, body, author, date, postType;
	int agree, disagree, hashTagId;

  @override
  State<CustomCard> createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard> {
	@override
  Widget build(BuildContext context) {
		if (widget.postType != 'hashtags') {
			
			/*
				This is where we return Card for news, events and announcements. 
				Notice that it does not have any thumbs up or thumbs down icons
			*/
			
			return Padding(
				padding: const EdgeInsets.fromLTRB(10, 10, 10, 0.0),
				child: (Card(
					child: Padding(
						padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
						child: Column(
							crossAxisAlignment: CrossAxisAlignment.stretch,
							children: [ 
								TextButton(
									onPressed: () => Navigator.pushNamed(context, '/singlePost', arguments: {
										'title': widget.title, 
										'date': widget.date, 
										'author': widget.author, 
										'body': widget.body
									}), 
									child: Text('${widget.title} \n'),
								),
								Text('${widget.author} \n'), 
								Text('${widget.date} \n'),
							],
						),
					),
				)),
			);
		}

		/*
			This is where we return a different card (only for hashtags tab of the navigator).
			Basically, we need some extra things in a hashtag-based card. 2 such things are 
			the thumbs up button and the thumbs down button
		*/

		else if (widget.postType == 'hashtags') {
			return Padding(
				padding: const EdgeInsets.fromLTRB(10, 10, 10, 0.0),
				child: (Card(
					child: Padding(
						padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
						child: Column(
							crossAxisAlignment: CrossAxisAlignment.stretch,
							children: [ 
								TextButton(
									onPressed: () => Navigator.pushNamed(context, '/singlePost', arguments: {
										'title': widget.title, 
										'date': widget.date, 
										'author': widget.author, 
										'body': widget.body
									}),
									child: Text('${widget.title} \n'),
								),
								Text('${widget.author} \n'), 
								Text('${widget.date} \n'),
								Row(
									mainAxisAlignment: MainAxisAlignment.center,
									children: [
										Row(
											children: [
												IconButton(
													
													/*
														We will wait here for what the function returns.
														That will let us know if this user has already reacted to this hashtag or not. 
														If the function returns false, it means that they have already reacted, so 
														we are sure that no changes have been made to the DB. Hence, we do not make
														any changes to our local state of the widget
													*/
													
													onPressed: ()  async {
														bool ret = await handleThumbsUpDown('up', widget.hashTagId);
														setState(() {
															if (ret) { 
																widget.agree++; 
															}
														});
													}, 
													icon: const Icon(Icons.thumb_up, color: Colors.blue,)
												),
												Text('${widget.agree}'), 
											],
										),
										const SizedBox(width: 15.0),
										Row(
											children: [
												IconButton(
													
													/*
														We will wait here for what the function returns.
														That will let us know if this user has already reacted to this hashtag or not. 
														If the function returns false, it means that they have already reacted, so 
														we are sure that no changes have been made to the DB. Hence, we do not make
														any changes to our local state of the widget
													*/
													
													onPressed: () async {
														bool ret = await handleThumbsUpDown('down', widget.hashTagId);
														setState( () {
															// fix this with a conditional stat
															if (ret) { 
																widget.disagree++; 
															}
														});
													}, 
													icon: const Icon(Icons.thumb_down, color: Colors.red,)
												),
												Text('${widget.disagree}')
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
		// returning this to avoid returning null from this widget
	}
}
