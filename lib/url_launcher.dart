import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
class Myweb extends StatelessWidget {
  const Myweb({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text('Forth Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            RichText(text: TextSpan(
              text: 'WebSite ',
              children: [
                TextSpan(
                  text: 'Here',
                  style: const TextStyle(color: Colors.blue,decoration: TextDecoration.underline),
                  recognizer: TapGestureRecognizer()..onTap = _launchWebsite,

                )
              ]
            )),
            const SizedBox(height: 20,),
            RichText(text: TextSpan(
              text: 'Go to  ',
              children: [
                TextSpan(
                  text: 'Email',
                  style: const TextStyle(color: Colors.blue,decoration: TextDecoration.underline),
                  recognizer: TapGestureRecognizer()..onTap = _launchEmail,

                ),

              ]
            )),
            const SizedBox(height: 20,),
            RichText(text: TextSpan(
              text: 'Go to  ',
              children: [
                TextSpan(
                  text: 'SMS',
                  style: const TextStyle(color: Colors.blue,decoration: TextDecoration.underline),
                  recognizer: TapGestureRecognizer()..onTap = _launchSms,

                ),

              ]
            )),
            const SizedBox(height: 20,),
            RichText(text: TextSpan(
              text: 'Go to  ',
              children: [
                TextSpan(
                  text: 'Mobile Number',
                  style: const TextStyle(color: Colors.blue,decoration: TextDecoration.underline),
                  recognizer: TapGestureRecognizer()..onTap = _launchTel,

                ),

              ]
            )),

          ],
        ),
      ),
    );
  }
 Future _launchWebsite()async{
    final Uri url= Uri.parse('https://youtube.com');
    if (!await launchUrl(url,
        mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch $url');
    }
 }
 Future _launchEmail()async{
   final Uri emailLaunchUri = Uri(
     scheme: 'mailto',
     path: '',
   );

   launchUrl(emailLaunchUri);
 }
 Future _launchSms()async{
   final Uri smsLaunchUri = Uri(
     scheme: 'sms',
     path: '7359509854',
   );
   await launchUrl(smsLaunchUri);
 }
  Future _launchTel()async{
    final Uri tellaunchuri = Uri(scheme: 'tel',path: '7359509854');
    await launchUrl(tellaunchuri);
  }
  
}
