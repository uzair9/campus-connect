import 'package:campus_connect/db/sessions.dart';
import 'package:campus_connect/db/local_db.dart';

var thisUser = activeUser['campusID'];
bool value = false;

Future<bool> handleThumbsUpDown(String thumbsDirection, int hashtagId) async {
	database['campusConnect']['hashtags'].forEach((item) {
		if (item['id'] == hashtagId) {
			if (!item['reactedBy'].contains(thisUser)) {
				thumbsDirection == 'up' ? item['agree'] += 1 : item['disagree'] += 1;
				// print('${item['agree']} / ${item['disagree']}');
				item['reactedBy'].add(thisUser);
				
				value = true;
			}
			else if (item['reactedBy'].contains(thisUser)) {
				value = false;
			}
		}
	});
	return value;
}
