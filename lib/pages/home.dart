import 'package:flutter/material.dart'; 
import 'package:campus_connect/widgets/drawer_widget.dart';
import 'package:campus_connect/pages/all_news.dart';
import 'package:campus_connect/pages/all_events.dart';
import 'package:campus_connect/pages/all_hashtags.dart';
import 'package:campus_connect/pages/all_announcements.dart';

class Home extends StatefulWidget {
	const Home({ Key? key }) : super(key: key);

	@override
	_HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
	int currentTab = 0;
	String tabName = 'News';
  final List<Widget> childrenList = [ const News(), const Events(), const Announcements(), const HashTags() ];

	void onTabTapped(int index) {
   setState(() {
     currentTab = index;
		 if (index == 0) tabName = 'News';
		 if (index == 1) tabName = 'Events';
		 if (index == 2) tabName = 'Announcements';
		 if (index == 3) tabName = '#HashTags';
		});
 	}
	
	@override
	Widget build(BuildContext context) {
		return(Scaffold(
			appBar: AppBar(
				title: Text(tabName), 
				centerTitle: true,
			),
			bottomNavigationBar: BottomNavigationBar(
				type: BottomNavigationBarType.fixed,
				currentIndex: currentTab,
				onTap: onTabTapped, // automatically passes the index to the function
				items: const [
					BottomNavigationBarItem(
						icon: Icon(Icons.feed),
						label: 'News'
					), 
					BottomNavigationBarItem(
						icon: Icon(Icons.celebration),
						label: 'Events'
					), 
					BottomNavigationBarItem(
						icon: Icon(Icons.campaign), 
						label: 'Announcements'
					),
					BottomNavigationBarItem(
						icon: Icon(Icons.tag),
						label: 'HashTags'
					),
				],
			),
			drawer: const CustomDrawer(),
			body: childrenList[currentTab], 
			floatingActionButton: FloatingActionButton(
				onPressed: () => {},
				child: const Icon(
					Icons.add,
					size: 36,
				)
			),
		));
	}
}
