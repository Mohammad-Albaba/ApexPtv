import 'dart:io';

import 'package:apex3/home_layout.dart';
import 'package:apex3/shared/bloc_observer.dart';
import 'package:apex3/shared/components/components.dart';
import 'package:apex3/shared/network/local/cache_helper.dart';
import 'package:apex3/shared/network/remote/dio_helper.dart';
import 'package:apex3/shared/styles/themes.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_mac/get_mac.dart';
import 'package:imei_plugin/imei_plugin.dart';
import 'package:m3u/m3u.dart';
import 'package:http/http.dart' as http;


Future<void> main() async{
  // final response =
  // await http.get(Uri.parse('https://m3u-editor.com/serve/92dfd5b0-9f86-11ec-8e83-3bcebe447cdf'));
  // final m3u = await M3uParser.parse(response.body);
  //
  // for (final entry in m3u) {
  //   print('Title: ${entry.title} Link: ${entry.link} Logo: ${entry.attributes['tvg-logo']}');
  // }

  WidgetsFlutterBinding.ensureInitialized();
  //await Firebase.initializeApp();
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  await CacheHelper.init();
  SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft,DeviceOrientation.landscapeRight]).then((_) => {
  runApp(MyApp()),
  });


}



class MyApp extends StatelessWidget {


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: ThemeMode.light,
      home: SplashScreen(),
    );
  }
}
class SplashScreen extends StatefulWidget {

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    initPlatformState();

  }

  String _macAddress = 'Unknown';
  String _imeiNumber = 'Unknown';
  Future<void> initPlatformState() async{
    String? macAddress;
    String? imeiNumber;

    try{
      macAddress = await GetMac.macAddress;
      imeiNumber = await ImeiPlugin.getImei(shouldShowRequestPermissionRationale: false);
    }on PlatformException{
      macAddress = 'Faild to get Device Mac Address';
    }
    if(!mounted) return;
    setState(() {
      _macAddress = macAddress!;
      _imeiNumber = imeiNumber!;
    });
  }
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky, overlays: [SystemUiOverlay.top]);
    Future.delayed(Duration(seconds: 3)).then((value){
      navigateAndFinish(context, HomeLayout(),);
    }
    );
  return Container(
    decoration: const BoxDecoration(
      image: DecorationImage(
        image: NetworkImage(
          'https://img.freepik.com/free-vector/modern-rectangular-block-pattern-border-vibrant-gradient-purple-banner-background_8087-4696.jpg?w=1380',
        ),
        fit: BoxFit.cover,
      ),),
    child: Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                  '${_macAddress} + mac',
                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                  color: Colors.white,
                ),
              ),
              Text(
                  '${_imeiNumber} + imei',
                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                  color: Colors.white,
                ),
              ),
            ],
           ),
      ),
      ),
  );
  }
}


