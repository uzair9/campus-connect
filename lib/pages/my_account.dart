import 'package:flutter/material.dart'; 
import 'package:campus_connect/widgets/my_account_card_widget.dart';
import 'package:campus_connect/db/local_db.dart';
import 'package:campus_connect/db/sessions.dart';

/*
	This is a very straighforward file.
	Keep looking at the actual screen on phone and read code
	from here. You will have no issue understanding what is going on
*/

class Account extends StatelessWidget {
	const Account({ Key? key }) : super(key: key);
	
	@override
	Widget build(BuildContext context) {
	
	String signedInPerson = activeUser['campusID'];
	List<String> academicYearConversion = ['First-Year Student', 'Sophomore Student', 'Junior-Year Student', 'Final-Year Student'];
		int academicYear = int.parse(database['campusConnect']['enrolledStudents'][signedInPerson]['academicYear']);
		
		return(Scaffold(
			body: SafeArea(
				child: Stack(
					children: [
						IconButton(
							onPressed: () => Navigator.pop(context),
							icon: const Icon(Icons.arrow_back_ios),
						), 
						Center(
							child: Padding(
								padding: const EdgeInsets.fromLTRB(15, 35, 15, 10),
								child: SingleChildScrollView(
									child: Column(
										children: [
											CircleAvatar(
												radius: MediaQuery.of(context).size.width * 0.25, 
												backgroundImage: const AssetImage('assets/images/user.png'),
												backgroundColor: Colors.transparent,
											),
											const SizedBox(height: 40),
											Text(database['campusConnect']['enrolledStudents'][signedInPerson]['firstName'] + ' ' + database['campusConnect']['enrolledStudents'][signedInPerson]['lastName'], 
												style: TextStyle(
													fontSize: 30, 
													color: Colors.blue[600],
													fontWeight: FontWeight.bold
												)
											),
											Row(
												mainAxisAlignment: MainAxisAlignment.center,
												children: [
													Text('${ academicYearConversion[academicYear - 1] } at LUMS'),
												]
											),
											const SizedBox(height: 23),

											/*
												Notice the my card widget. MyCard widget
												returns a tile for us that we displaying on the page. 
												We pass the following info to this card: 
												1) leading icon
												2) tile title
												3) tile subtitle (which comes from user's info store by admins in the DB)
											*/
											
											MyCard(icon: const Icon(Icons.apartment, color: Colors.blue, size: 33), tileTile: 'School', tileSubtitle: database['campusConnect']['enrolledStudents'][signedInPerson]['school']),
											MyCard(icon: const Icon(Icons.receipt_long, color: Colors.blue, size: 33), tileTile: 'Degree Program', tileSubtitle: database['campusConnect']['enrolledStudents'][signedInPerson]['degreeProgram']),
											MyCard(icon: const Icon(Icons.schedule, color: Colors.blue, size: 33), tileTile: 'Academic Year', tileSubtitle: database['campusConnect']['enrolledStudents'][signedInPerson]['academicYear']),
											MyCard(icon: const Icon(Icons.checklist, color: Colors.blue, size: 33), tileTile: 'Credits Completed', tileSubtitle: database['campusConnect']['enrolledStudents'][signedInPerson]['creditsTaken']),
											MyCard(icon: const Icon(Icons.star, color: Colors.blue, size: 33), tileTile: 'CGPA', tileSubtitle: database['campusConnect']['enrolledStudents'][signedInPerson]['cgpa']),
											MyCard(icon: const Icon(Icons.school, color: Colors.blue, size: 33), tileTile: 'Graduation Year', tileSubtitle: database['campusConnect']['enrolledStudents'][signedInPerson]['graduationYear']),
										],
									),
								),
							),
						)
					], 
				)
			)
		));
	}
}
