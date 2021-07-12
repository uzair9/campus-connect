import 'package:flutter/material.dart'; 

class About extends StatelessWidget {
	const About({ Key? key }) : super(key: key);

	@override
	Widget build(BuildContext context) {
		return(Scaffold(
			body: SingleChildScrollView(
				child: SafeArea(
					child: Stack(
						children: [
							IconButton(
								icon: const Icon(Icons.arrow_back_ios),
								onPressed: () => Navigator.pop(context),
							),
							Padding(
								padding: EdgeInsets.all(30.0),
								child: Center(
									child: Column(
										children: [
											CircleAvatar(
												radius: MediaQuery.of(context).size.width * 0.35,
												backgroundImage: AssetImage('assets/images/me-2.jpg'),
												backgroundColor: Colors.transparent,
											),
											SizedBox(height: 30),
											Text('Uzair Afzal created this app from the ground up in his 2021 Summer break as a rising final-year student at LUMS \n', 
												style: TextStyle(
													fontSize: 16, 
													wordSpacing: 2
												)
											), 
											Text('About Uzair Afzal', 
												style: TextStyle(
													fontWeight: FontWeight.bold, 
													fontSize: 25, 
													color: Colors.blue[600]
												)
											),
											SizedBox(height: 20,),
											Text('Uzair is a final-year computer science and software engineering student at Lahore University of Management Sciences (LUMS) \n\nHe describes himsself as a technology-business enthusiast. He is very much intrigued by computer hardware, the semiconductor industry, finance of investments, economics, and technology entrepreneurship. Recently, he found his interest in moral philosophy and psychology \n\nUzair has been engineering software for web, mobile and Ethereum blockchain since 2019, and he is quite passionate about it as well \n\nGet in touch with him, or follow him on the following social platforms',
												style: TextStyle(
													fontSize: 16, 
													wordSpacing: 2
												)
											),
											SizedBox(height: 30),
											Row(
												mainAxisAlignment: MainAxisAlignment.center,
												children: [
													Stack(
														children: [
															Positioned(
																child: Row(
																	children: [
																		RawMaterialButton(
																			elevation: 7.0,
																			onPressed: () {},
																			fillColor: Color(0xFFF5F6F9),
																			child: Icon(Icons.facebook, color: Colors.blue, size: 35,),
																			padding: EdgeInsets.all(7.0),
																			shape: CircleBorder(),
																		),
																		RawMaterialButton(
																			elevation: 7.0,
																			onPressed: () async {
																				
																			},
																			fillColor: Colors.transparent,
																			child: Icon(Icons.mail_rounded, color: Colors.blue, size: 35),
																			padding: EdgeInsets.all(7.0),
																			shape: CircleBorder(),
																		),
																		RawMaterialButton(
																			elevation: 7.0,
																			onPressed: () {},
																			fillColor: Colors.transparent,
																			child: Icon(Icons.public_rounded, color: Colors.blue, size: 35),
																			padding: EdgeInsets.all(7.0),
																			shape: CircleBorder(),
																		),
																	],
																)
															),
														],
													)
												],
											)
										],
									),
								),
							)
						],
					)
				)
			)
		));
	}
}
