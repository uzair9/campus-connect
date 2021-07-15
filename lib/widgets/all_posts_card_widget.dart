import 'package:flutter/material.dart';
import 'package:campus_connect/helpers/thumbs_up_down.dart';

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
									onPressed: () => Navigator.pushNamed(context, '/singleNews', arguments: {
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
	}
}
