import 'package:flutter/material.dart'; 
import 'temp_widgets.dart';
import 'package:campus_connect/widgets/drawer_widget.dart';

void main() => runApp(MaterialApp( 
	home: Home()
));

class Home extends StatefulWidget {
	const Home({ Key? key }) : super(key: key);

	@override
	_HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
	int currentTab = 0;
	String tabName = 'News';
  final List<Widget> childrenList = [ Zero(), One(), Two(), Three() ];

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
				items: [
					BottomNavigationBarItem(
						icon: Icon(Icons.feed),
						title: Text('News')
					), 
					BottomNavigationBarItem(
						icon: Icon(Icons.celebration),
						title: Text('Events')
					), 
					BottomNavigationBarItem(
						icon: Icon(Icons.campaign), 
						title: Text('Announcements')
					),
					BottomNavigationBarItem(
						icon: Icon(Icons.tag),
						title: Text('HashTags')
					),
				],
			),
			drawer: CustomDrawer(),
			body: childrenList[currentTab], 
			floatingActionButton: FloatingActionButton(
				onPressed: () => print('Add New News'),
				child: Icon(
					Icons.add,
					size: 36,
				)
			),
		));
	}
}
