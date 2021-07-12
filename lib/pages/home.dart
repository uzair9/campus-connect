import 'package:flutter/material.dart'; 
import 'package:campus_connect/widgets/drawer_widget.dart';
import 'package:campus_connect/pages/all_posts.dart';

class Home extends StatefulWidget {
	const Home({ Key? key }) : super(key: key);

	@override
	_HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
	int currentTab = 0;
	String tabName = 'News';
  
	final List <Widget> widgetList = 
	[
		const AllPosts(postType: 'news'),
		const AllPosts(postType: 'events'),
		const AllPosts(postType: 'announcements'),
		const AllPosts(postType: 'hashtags')
	];

	final List<String> allTabNames = ['News', 'Events', 'Announcements', '#HashTags'];

	void onTabTapped(int index) {
		setState(() {
			currentTab = index;
			tabName = allTabNames[currentTab];
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
			
			body: widgetList[currentTab],
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
