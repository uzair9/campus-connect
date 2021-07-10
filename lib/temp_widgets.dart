import 'package:flutter/material.dart'; 

class Zero extends StatelessWidget {
	const Zero({ Key? key }) : super(key: key);

	@override
	Widget build(BuildContext context) {
		return(Scaffold(
			body: Center(
				child: Text('News')
			),
		)
		);
	}
}


class One extends StatelessWidget {
	const One({ Key? key }) : super(key: key);

	@override
	Widget build(BuildContext context) {
		return(Scaffold(
			body: Center(
				child: Text('Events')
			),
		)
		);
	}
}


class Two extends StatelessWidget {
	const Two({ Key? key }) : super(key: key);

	@override
	Widget build(BuildContext context) {
		return(Scaffold(
			body: Center(
				child: Text('Announcements')
			),
		)
		);
	}
}


class Three extends StatelessWidget {
	const Three({ Key? key }) : super(key: key);

	@override
	Widget build(BuildContext context) {
		return(Scaffold(
			body: Center(
				child: Text('HashTags')
			),
		)
		);
	}
}
