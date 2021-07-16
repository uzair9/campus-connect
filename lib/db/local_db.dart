/*
	If we extend the application and make Firebase connection, 
	this local DB will be deleted. Rather, this Map will be 
	populated with database's data (while showing the splash screen)
*/

Map database = {
	'campusConnect': {
		'enrolledStudents': {
			'22100031': {
				'password': '123', 
				'firstName': 'Uzair', 
				'lastName': 'Afzal',
				'creditsTaken': '97 / 130', 
				'school': 'Sayed Babar Ali School of Sciences & Engineering (SBASSE)', 
				'academicYear': '4', 
				'graduationYear': '2022',
				'cgpa': '3.527', 
				'degreeProgram': 'Computer Science & Software Engineering'
			}, 
			'22100032': {
				'password': '1234',
				'firstName': 'Maria', 
				'lastName': 'Rathore',
				'creditsTaken': '65 / 130',
				'school': 'Suleman Dawood School of Business (SDSB)', 
				'academicYear': '3', 
				'graduationYear': '2023',
				'cgpa': '3.164', 
				'degreeProgram': 'Accounting & Finance'
			}, 
		},

		/*
			down below, in news, events and announcements arrays, reactedBy [] is just a dummy field
			it is not being used, but if we remove it then some type casting errors are thrown at the run
			time and the app crashes. Do not remove this field

			Error: Map<String, String> was expected but Map<String, Object> was obtained
		*/	
		
		'news': [
			{
				'id': 0,
				'title': 'LUMS Appoints New Vice Chancellor', 
				'body': 'Prior to his current role as Vice Chancellor LUMS, Dr. Arshad Ahmad served as Vice Provost, Teaching and Learning, and Director of the MacPherson Institute at McMaster University in Canada. \n\nHe is also Chair of Teaching and Learning Canada, former President of Society for Teaching and Learning in Higher Education and former Vice President of International Consortium of Educational Developers. \n\nDr. Ahmad completed his MBA and later PhD in Educational Psychology at McGill University, won a lifetime 3M National Teaching Fellowship in 1992 and was a professor of finance at Concordia and McMaster Universities. \n\nHis research interests are in student evaluations of teaching, approaches to teaching, teaching philosophies and student partnerships',
				'author': 'LUMS Administration', 
				'date': '2021-07-11', 
				'agree': 0, 
				'disagree': 0, 
				'reactedBy': []
			},
			{
				'id': 1,
				'title': 'LUMS Facebook Innovation Labs', 
				'body': 'Welcome to Facebook Innovation Lab Pakistan, a tech space for innovation where ideas can grow and flourish.In partnership with Ignite National Technology Fund, we’re building a community driven by the thirst for innovation. \n\nExplore our Virtual Reality Lab, which provides support to VR-focused start-ups and opportunities to create positive impact together. The future of Pakistan is bright. \n\nJoin our community of innovators, and let your start-up make its mark upon our country, then the world',
				'author': 'LUMS National Incubation Center',
				'date': '2021-05-4', 
				'agree': 0, 
				'disagree': 0, 
				'reactedBy': []
			},
		],

		'events': [
			{
				'id': 0,
				'title': '2021 O-Week Begins!', 
				'author': 'The O-Week Team', 
				'date': '2021-05-25', 
				'body': 'We are excited for you to join the vibrant Luminite community that continues to make its mark across the world. O-Week is your first opportunity to experience life at LUMS! \n\nThis comprehensive orientation programme will give you the opportunity to meet peers and faculty, get a feel of university life, and find out what it means to be a part of this community',
				'agree': 0, 
				'disagree': 0, 
				'reactedBy': []
			},
			{ 
				'id': 1,
				'title': 'Student Council Elections, 2021', 
				'author': 'LUMS Student Council',
				'date': '2020-09-23', 
				'body': 'LUMS Student Council elections are carried out every year. Each year, participants from all five schools at LUMS, viz. SBASSE, SDSB, MGHSS, SAHSOL and School of Education participate with greate vigour and rigour. \n\nThis year the elections will be held on 14th of October. All the participants are very much prepared for the event. All participants must submit their documents and their speeches by 1st October. \n\nOnly the shortlisted candidates will be given a chance to run for the electoral positions in the Student Council', 
				'agree': 0, 
				'disagree': 0, 
				'reactedBy': []
			}, 
		],

		'announcements': [
			{
				'id': 0,
				'title': 'Campus Smoking Policy & SOPs', 
				'author': 'Administration', 
				'date': '2021-05-29', 
				'body': 'There are some rules for smoking in LUMS. For smoking our main objective is to ensure that smoking is confined to designated areas. \n\nWe are hoping that persuasion rather than penalties will be the main mechanism for achieving our objective, but we want this to be taken seriously. The penalties for persistent violation of SOPs will be: \n\n1st Violation – Verbal/Written Warning (via email). \n\n2nd Violation – A fine of Rs. 5000/- or 20 hours of community service. \n\n3rd Violation – A fine of Rs. 10,000/- or 40 hours of community service. \n\n4th violation – semester off for students/reporting to Dean or HOD in case of faculty or staff.',
				'agree': 0, 
				'disagree': 0, 
				'reactedBy': []
			},
			{
				'id': 1,
				'title': 'Fall Semester Class Schedule', 
				'author': 'Registrar\'s Office', 
				'date': '2021-06-24', 
				'body': 'Fall 2021 instructions are planned to be a combination of some classes conducted entirely in-person, and others to have online instruction ONLY. \n\nThis modality will allow classes to be conducted by following health and safety precautionary measures. \n\nAccordingly, the first version of Fall 2021 Class Schedule has been published on RO portal and can be accessed at this given navigation: http://portal.lums.edu.pk/RegistrarOffice > Documents to Download > Course Memo and Schedules',
				'agree': 0, 
				'disagree': 0, 
				'reactedBy': []
			}
		],

		'hashtags': [
			{
				'id': 0,
				'title': '#OpenLUMS', 
				'author': 'Samina Malik', 
				'date': '2021-07-12', 
				'body': 'LUMS students want their university to be opened. As all the other universities are opening up, why is LUMS still closed? \n\nIf students can follow SOPs at other universities and take in-person lectures, why can\'t we?',
				'agree': 76,
				'disagree': 2, 
				'reactedBy': []
			},
			{
				'id': 1,
				'title': '#ReduceFees', 
				'author': 'Khadija A\'wan', 
				'date': '2021-06-17', 
				'body': 'I am not ready to believe that LUMS is charging us the same amount of money for making us sit in front of stupid Zoom. \n\nThe administration tells us that they are losing money during COVID-19. However, no lab equipment, ACs, water, gas and hostel electric equipment is being used these days. How can a university lose money in such a scenario? This is just impossible. \n\nWe demand reduction in our fee or the opening of campus!', 
				'agree': 98, 
				'disagree': 1, 
				'reactedBy': []
			},
		]
	}
};
