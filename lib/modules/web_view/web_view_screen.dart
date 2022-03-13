import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewScreen extends StatelessWidget {

  final String url;

  WebViewScreen(this.url);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(
            'https://as2.ftcdn.net/v2/jpg/02/24/24/87/1000_F_224248732_eMGV8CKsfJy20jkFwWo5HsuzjgJTZE23.jpg',
            //  "https://t4.ftcdn.net/jpg/03/78/51/99/240_F_378519944_B3G74VMWrXrvyfpjIDBz7ypkh4i05mx7.jpg",
          ),
          fit: BoxFit.cover,
        ),),
      child: Scaffold(
        body: Stack(
          children: [
            WebView(
              initialUrl: url,
              zoomEnabled: true,
            ),
            Padding(
              padding: const EdgeInsets.all(40.0),
              child: InkWell(
                child: Container(
                    height: 25,
                    width: 25,
                    child: Icon(Icons.arrow_back_ios,color: Colors.white,size: 18,)),
                onTap: () => Navigator.pop(context),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
