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
								padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 30),
								child: Center(
									child: Column(
										children: [
											CircleAvatar(
												radius: MediaQuery.of(context).size.width * 0.35,
												backgroundImage: const AssetImage('assets/images/me-2.jpg'),
												backgroundColor: Colors.transparent,
											),
											const SizedBox(height: 30),
											const Text('Uzair Afzal created this app from the ground up in his 2021 Summer break as a rising final-year student at LUMS \n', 
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
											const SizedBox(height: 20,),
											const Text('Uzair is a final-year computer science and software engineering student at Lahore University of Management Sciences (LUMS) \n\nHe describes himself as a technology-business enthusiast, as he is very much intrigued by computer hardware, the semiconductor industry, finance of investments, economics, and technology entrepreneurship. Recently, he found his interest in moral philosophy and psychology \n\nUzair has been engineering software for the web (LAMPP & MERN stacks), mobile (iOS & Android) and blockchain (Ethereum) since 2019, and he is quite passionate about it as well \n\nGet in touch with him, or follow him on the following social platforms',
												style: TextStyle(
													fontSize: 16, 
													wordSpacing: 2
												)
											),
											const SizedBox(height: 30),
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
																			fillColor: const Color(0xFFF5F6F9),
																			child: const Icon(Icons.facebook, color: Colors.blue, size: 35,),
																			padding: const EdgeInsets.all(7.0),
																			shape: const CircleBorder(),
																		),
																		RawMaterialButton(
																			elevation: 7.0,
																			onPressed: () async {
																				
																			},
																			fillColor: Colors.transparent,
																			child: const Icon(Icons.mail_rounded, color: Colors.blue, size: 35),
																			padding: const EdgeInsets.all(7.0),
																			shape: const CircleBorder(),
																		),
																		RawMaterialButton(
																			elevation: 7.0,
																			onPressed: () {},
																			fillColor: Colors.transparent,
																			child: const Icon(Icons.public_rounded, color: Colors.blue, size: 35),
																			padding: const EdgeInsets.all(7.0),
																			shape: const CircleBorder(),
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
