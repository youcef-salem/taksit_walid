import 'package:url_launcher/url_launcher.dart';




class Luncher {
static final  String extension ='tel:';


  static Future<void> luncher(String url,String?extemnsion ) async {
    final Uri _url = Uri.parse(extemnsion!+url);
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    } else {
      launchUrl(_url);
    }
  }
}
