import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';


class Splash extends StatelessWidget {
	const Splash({ Key? key }) : super(key: key);

	void nextScreen(context) {
		Future.delayed(const Duration(seconds: 3), () => {
			Navigator.pushReplacementNamed(context, '/signin')
		});
	}

	@override
	Widget build(BuildContext context) {
		nextScreen(context);
		
		return Scaffold(
			body: Center(
				child: Column(
					mainAxisAlignment: MainAxisAlignment.center,
					children: [
						CircleAvatar(
							backgroundImage: const AssetImage('assets/images/logo.png'),
							radius: MediaQuery.of(context).size.width * 0.45,
							backgroundColor: Colors.transparent,
						),
						SpinKitWave(
							color: Colors.blue[600],
							size: 30.0,
							// controller: AnimationController(vsync: this, duration: const Duration(milliseconds: 1200)),
						)
					]
				),
			)
		);
	}
}
