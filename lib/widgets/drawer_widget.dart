import 'package:flutter/material.dart'; 
import 'package:flutter/cupertino.dart';
import 'package:campus_connect/helpers/alert_popup.dart';

class CustomDrawer extends StatelessWidget {
	const CustomDrawer({ Key? key }) : super(key: key);

	@override
	Widget build(BuildContext context) {
		return Drawer(
			child: Column(
				crossAxisAlignment: CrossAxisAlignment.stretch,
				children: [
					SizedBox(
						height: 300,
						child: DrawerHeader(
							decoration: BoxDecoration(
								color: Colors.blue[100],
							),
							child: const CircleAvatar(
								backgroundImage: AssetImage('assets/images/logo.png'),
								backgroundColor: Colors.transparent,
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
									onTap: () => Navigator.pushNamed(context, '/account'),
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
									onTap: () => Navigator.pushNamed(context, '/about'),
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
									onTap: () => alertPopUp(
										'Sign Out?', 
										'Are you sure you want to sign out of Campus Connect? Be notified that doing so will make you lose all your work in progress (if any)', 
										context
									),
									child: const Text('Sign Out'),
								),
							],
						),
					),
				]
			),
		);
	}
}
