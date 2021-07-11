import 'package:flutter/material.dart'; 

class CustomDrawer extends StatelessWidget {
	const CustomDrawer({ Key? key }) : super(key: key);

	@override
	Widget build(BuildContext context) {
		return Container(
			child: Drawer(
				child: Column(
					crossAxisAlignment: CrossAxisAlignment.stretch,
					children: [
						Container(
							height: 300,
							child: DrawerHeader(
							decoration: BoxDecoration(
								color: Colors.blue,
								
							),
							child: CircleAvatar(
								// backgroundImage: AssetImage('assets/images/'),
							),
						),
						),
						Padding(
							padding: const EdgeInsets.fromLTRB(20, 20, 0, 10),
							child: Row(
								children: [
									const Icon(
										Icons.manage_accounts,
										color: Colors.black,
									),
									const SizedBox(width: 7),
									InkWell(
										onTap: () => print('Profile'),
										child: const Text('My Account'),
									),
								],
							),
						),
						Padding(
							padding: const EdgeInsets.fromLTRB(20, 20, 0, 20),
							child: Row(
								children: [
									const Icon(
										Icons.people, 
										color: Colors.black,
									),
									const SizedBox(width: 7),
									InkWell(
										onTap: () => print('About Us'),
										child: const Text('About Us'),
									),
								],
							),
						),
						const Spacer(),
						const Divider(
							color: Colors.grey,
						),
						Padding(
							padding: const EdgeInsets.fromLTRB(20, 10, 0, 20),
							child: Row(
								children: [
									Icon(
										Icons.lock, 
										color: Colors.grey[700],
									),
									const SizedBox(width: 7),
									InkWell(
										onTap: () => print('Log Out'),
										child: const Text('Log Out'),
									),
								],
							),
						),
					]
				),
			),
		);
	}
}
