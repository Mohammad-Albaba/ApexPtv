import 'package:apex3/main.dart';
import 'package:apex3/models/articale_model.dart';
import 'package:apex3/modules/ip/ip_info_api.dart';
import 'package:apex3/shared/components/components.dart';
import 'package:apex3/shared/components/constant.dart';
import 'package:apex3/shared/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_mac/get_mac.dart';
import 'package:imei_plugin/imei_plugin.dart';
import 'package:video_player/video_player.dart';


import 'modules/web_view/web_view_screen.dart';

class HomeLayout extends StatefulWidget {

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
   String _macAddress = 'Unknown';
   String _imeiNumber = 'Unknown';


  final textController = TextEditingController(text: urlLandscapeVideo);
  ArticaleModel articaleModel;

  @override
  void initState() {
    super.initState();
    initPlatformState();
    controller = VideoPlayerController.network(textController.text)
      ..addListener(() => setState(() {}))
      ..setLooping(true)
      ..initialize().then((_) => controller.play());
  }

  Future<void> initPlatformState() async{
    String macAddress;
    String imeiNumber;

    try{
      macAddress = await GetMac.macAddress;
      imeiNumber = await ImeiPlugin.getImei(shouldShowRequestPermissionRationale: false);
    }on PlatformException{
        macAddress = 'Faild to get Device Mac Address';
    }
    if(!mounted) return;
    setState(() {
      _macAddress = macAddress;
      _imeiNumber = imeiNumber;
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    final isMuted = controller.value.volume == 0;

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
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          iconTheme: IconThemeData(
             color: Colors.white,
          ),
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            statusBarIconBrightness: Brightness.light,
          ),
          title: Text(
            'Apex Ptv',
            style: Theme.of(context).textTheme.bodyText1.copyWith(
              fontFamily: 'Jannah',
              color: Colors.white
            ),
          ),
          centerTitle: true,
          leading: Tab(icon: Icon(Icons.ondemand_video_outlined),),
          actions: [
            IconButton(
              icon: Icon(
                Icons.search,
              ),
              onPressed: (){
                //navigateTo(context, SearchScreen(),);
              },
            ),
            IconButton(
              icon: Icon(
                Icons.brightness_4_outlined,
              ),
              onPressed: (){
              //  AppCubit.get(context).changeAppMode();
              },
            ),
          ],
        ),
        body: OrientationBuilder(
         builder: (context, orientation){
           return orientation == Orientation.portrait
               ? Column(
             children: [
                 controller != null && controller.value.isInitialized
                   ? Expanded(
                 flex: 2,
                 child: Stack(
                   children: [
                   Container(alignment: Alignment.topCenter, child: buildVideo()),
                   Positioned.fill(child: Container(

                     alignment: AlignmentDirectional.bottomEnd,
                     height: 10.0,
                     width: 10.0,
                     child: IconButton(
                       icon: Icon(
                         isMuted ? Icons.volume_mute : Icons.volume_up,
                         color: Colors.white,
                       ),
                       onPressed: () => controller.setVolume(isMuted ? 1 : 0),
                     ),
                   ),)
                 ],),
               )
                   : Container(
                 height: 200,
                 child: Center(child: CircularProgressIndicator()),
               ),
               // SizedBox(
               //   height: 10,
               // ),
               // Text(
               //     '${_macAddress} + mac'
               // ),
               //   Text(
               //     '${_imeiNumber} + imei'
               //   ),
               Expanded(
                 flex: 5,
                 child: Container(
                   child: SingleChildScrollView(
                     child: Column(
                       children: [
                         InkWell(child: buildArticleItem(ArticaleModel(id: 1, title: 'مسلسلات كويتية', subTitle: 'قاصد خير', image: 'https://media.elcinema.com/uploads/_315x420_ba81bacb69d5e3b4fefb3e85d8cbbe17cbce2d3349a61aee8a9390be353ce9a9.jpg', url: 'http://aromatv.co:80/series/aroma-it4k/Yst88773kkh/82463.mp4'),context),
                           onTap: ()
                           {
                             setState(() {
                               controller.dispose();
                               textController.text.trim().isEmpty;
                               textController.text = 'http://aromatv.co:80/series/aroma-it4k/Yst88773kkh/82463.mp4';
                               controller = VideoPlayerController.network('http://aromatv.co:80/series/aroma-it4k/Yst88773kkh/82463.mp4')
                                 ..addListener(() => setState(() {}))
                                 ..setLooping(true)
                                 ..initialize().then((_) => controller.play());
                               buildVideo();
                               buildVideoPlayer();

                             });

                             // navigateTo(context, WebViewScreen(articaleModel.url),);
                           },
                         ),
                         InkWell(child: buildArticleItem(ArticaleModel(id: 2, title: 'أفلام مصرية', subTitle: 'رامز مجنون رسمي', image: 'https://www.hiamag.com/sites/default/files/styles/1000xauto/public/article/07/04/2021/10405581-1288972419.jpg?itok=qiMHvwXt', url: 'http://aromatv.co:80/series/aroma-it4k/Yst88773kkh/37530.mp4'),context),
                           onTap: ()
                           {
                             setState(() {
                               controller.dispose();
                               textController.text.trim().isEmpty;
                               textController.text = 'http://aromatv.co:80/series/aroma-it4k/Yst88773kkh/37530.mp4';
                               controller = VideoPlayerController.network('http://aromatv.co:80/series/aroma-it4k/Yst88773kkh/37530.mp4')
                                 ..addListener(() => setState(() {}))
                                 ..setLooping(true)
                                 ..initialize().then((_) => controller.play());
                               buildVideo();
                               buildVideoPlayer();

                             });

                             // navigateTo(context, WebViewScreen(articaleModel.url),);
                           },
                         ),
                         InkWell(child: buildArticleItem(ArticaleModel(id: 3, title: 'مسلسلات سورية', subTitle: 'باب الحارة', image: 'https://media.elcinema.com/uploads/_315x420_66f50fe0a9574deed6a5daf6d39ca19b287eb56571e4300f8eb300737bdf2595.jpg', url: 'http://aromatv.co:80/series/aroma-it4k/Yst88773kkh/188526.mp4'),context),
                           onTap: ()
                           {
                             setState(() {
                               controller.dispose();
                               textController.text.trim().isEmpty;
                               textController.text = 'http://aromatv.co:80/series/aroma-it4k/Yst88773kkh/188526.mp4';
                               controller = VideoPlayerController.network('http://aromatv.co:80/series/aroma-it4k/Yst88773kkh/188526.mp4')
                                 ..addListener(() => setState(() {}))
                                 ..setLooping(true)
                                 ..initialize().then((_) => controller.play());
                               buildVideo();
                               buildVideoPlayer();

                             });

                             // navigateTo(context, WebViewScreen(articaleModel.url),);
                           },
                         ),
                         InkWell(child: buildArticleItem(ArticaleModel(id: 4, title: 'حلقات رياضية', subTitle: 'علم البسطاء', image: 'https://img.arabshoppy.com/ae04/kf/H1b7da45feebf4682974ab0178fe4df8aV.jpg', url: 'http://aromatv.co:80/series/aroma-it4k/Yst88773kkh/16644.mp4'),context),
                           onTap: (){
                             setState(() {
                               controller.dispose();
                               textController.text.trim().isEmpty;
                               textController.text = 'http://aromatv.co:80/series/aroma-it4k/Yst88773kkh/16644.mp4';
                               controller = VideoPlayerController.network('http://aromatv.co:80/series/aroma-it4k/Yst88773kkh/16644.mp4')
                                 ..addListener(() => setState(() {}))
                                 ..setLooping(true)
                                 ..initialize().then((_) => controller.play());
                               buildVideo();
                               buildVideoPlayer();

                             });
                           },
                         ),
                         InkWell(child: buildArticleItem(ArticaleModel(id: 5, title: 'حلقات رمضانية', subTitle: 'ما حدش فاهم حاجة', image: 'https://i.pinimg.com/originals/81/10/65/811065ec2b2a23351eeef52f211f6d14.jpg', url: 'http://aromatv.co:80/series/aroma-it4k/Yst88773kkh/37797.mp4'),context),
                           onTap: (){
                             setState(() {
                               controller.dispose();
                               textController.text.trim().isEmpty;
                               textController.text = 'http://aromatv.co:80/series/aroma-it4k/Yst88773kkh/37797.mp4';
                               controller = VideoPlayerController.network('http://aromatv.co:80/series/aroma-it4k/Yst88773kkh/37797.mp4')
                                 ..addListener(() => setState(() {}))
                                 ..setLooping(true)
                                 ..initialize().then((_) => controller.play());
                               buildVideo();
                               buildVideoPlayer();

                             });
                           },),
                         SizedBox(
                           height: 20.0,
                         ),
                       ],
                     ),
                   ),
                 ),
               ),
             ],
           )
               : Row(
                 children: [
                   controller != null && controller.value.isInitialized
                       ? Expanded(
                     flex: 1,
                     child: Column(
                       mainAxisAlignment: MainAxisAlignment.start,
                       children: [
                         Stack(children: [
                           Container(
                             height: 100,
                               alignment: Alignment.topCenter, child: InkWell(child: buildVideo(),)
                           ),
                           Positioned.fill(child: Container(
                             alignment: AlignmentDirectional.bottomEnd,
                             height: 10.0,
                             width: 10.0,
                             child: IconButton(
                               icon: Icon(
                                 isMuted ? Icons.volume_mute : Icons.volume_up,
                                 color: Colors.white,
                               ),
                               onPressed: () => controller.setVolume(isMuted ? 1 : 0),
                             ),
                           ),)
                         ],),
                       ],
                     ),
                   )
                       : Expanded(
                         child: Container(
                     height: 100,
                     child: Center(child: CircularProgressIndicator()),
                   ),
                       ),
                   // SizedBox(
                   //   height: 10,
                   // ),
                   // Text(
                   //     '${_macAddress} + mac'
                   // ),
                   //   Text(
                   //     '${_imeiNumber} + imei'
                   //   ),
                      Padding(
                        padding: const EdgeInsetsDirectional.only(
                          start: 8.0,
                        ),
                        child: Container(
                          width: 2,
                          height: double.infinity,
                          color: Colors.grey[300],
                        ),
                      ),
                      Expanded(
                     flex: 3,
                     child: Container(
                       child: SingleChildScrollView(
                         scrollDirection: Axis.horizontal,
                         child: Row(
                           children: [
                             InkWell(child: buildArticleItemLandscape(ArticaleModel(id: 1, title: 'مسلسلات كويتية', subTitle: 'قاصد خير', image: 'https://media.elcinema.com/uploads/_315x420_ba81bacb69d5e3b4fefb3e85d8cbbe17cbce2d3349a61aee8a9390be353ce9a9.jpg', url: 'http://aromatv.co:80/series/aroma-it4k/Yst88773kkh/82463.mp4'),context),
                               onTap: ()
                               {
                                 setState(() {
                                   controller.dispose();
                                   textController.text.trim().isEmpty;
                                   textController.text = 'http://aromatv.co:80/series/aroma-it4k/Yst88773kkh/82463.mp4';
                                   controller = VideoPlayerController.network('http://aromatv.co:80/series/aroma-it4k/Yst88773kkh/82463.mp4')
                                     ..addListener(() => setState(() {}))
                                     ..setLooping(true)
                                     ..initialize().then((_) => controller.play());
                                   buildVideo();
                                   buildVideoPlayer();

                                 });
                                 // navigateTo(context, WebViewScreen(articaleModel.url),);
                               },
                             ),
                             InkWell(child: buildArticleItemLandscape(ArticaleModel(id: 2, title: 'أفلام مصرية', subTitle: 'رامز مجنون رسمي', image: 'https://www.hiamag.com/sites/default/files/styles/1000xauto/public/article/07/04/2021/10405581-1288972419.jpg?itok=qiMHvwXt', url: 'http://aromatv.co:80/series/aroma-it4k/Yst88773kkh/37530.mp4'),context),
                               onTap: ()
                               {
                                 setState(() {
                                   controller.dispose();
                                   textController.text.trim().isEmpty;
                                   textController.text = 'http://aromatv.co:80/series/aroma-it4k/Yst88773kkh/37530.mp4';
                                   controller = VideoPlayerController.network('http://aromatv.co:80/series/aroma-it4k/Yst88773kkh/37530.mp4')
                                     ..addListener(() => setState(() {}))
                                     ..setLooping(true)
                                     ..initialize().then((_) => controller.play());
                                   buildVideo();
                                   buildVideoPlayer();

                                 });

                                 // navigateTo(context, WebViewScreen(articaleModel.url),);
                               },
                             ),
                             InkWell(child: buildArticleItemLandscape(ArticaleModel(id: 3, title: 'مسلسلات سورية', subTitle: 'باب الحارة', image: 'https://media.elcinema.com/uploads/_315x420_66f50fe0a9574deed6a5daf6d39ca19b287eb56571e4300f8eb300737bdf2595.jpg', url: 'http://aromatv.co:80/series/aroma-it4k/Yst88773kkh/188526.mp4'),context),
                               onTap: ()
                               {
                                 setState(() {
                                   controller.dispose();
                                   textController.text.trim().isEmpty;
                                   textController.text = 'http://aromatv.co:80/series/aroma-it4k/Yst88773kkh/188526.mp4';
                                   controller = VideoPlayerController.network('http://aromatv.co:80/series/aroma-it4k/Yst88773kkh/188526.mp4')
                                     ..addListener(() => setState(() {}))
                                     ..setLooping(true)
                                     ..initialize().then((_) => controller.play());
                                   buildVideo();
                                   buildVideoPlayer();

                                 });

                                 // navigateTo(context, WebViewScreen(articaleModel.url),);
                               },
                             ),
                             InkWell(child: buildArticleItemLandscape(ArticaleModel(id: 4, title: 'حلقات رياضية', subTitle: 'علم البسطاء', image: 'https://img.arabshoppy.com/ae04/kf/H1b7da45feebf4682974ab0178fe4df8aV.jpg', url: 'http://aromatv.co:80/series/aroma-it4k/Yst88773kkh/16644.mp4'),context),
                               onTap: (){
                                 setState(() {
                                   controller.dispose();
                                   textController.text.trim().isEmpty;
                                   textController.text = 'http://aromatv.co:80/series/aroma-it4k/Yst88773kkh/16644.mp4';
                                   controller = VideoPlayerController.network('http://aromatv.co:80/series/aroma-it4k/Yst88773kkh/16644.mp4')
                                     ..addListener(() => setState(() {}))
                                     ..setLooping(true)
                                     ..initialize().then((_) => controller.play());
                                   buildVideo();
                                   buildVideoPlayer();

                                 });
                               },
                             ),
                             InkWell(child: buildArticleItemLandscape(ArticaleModel(id: 5, title: 'حلقات رمضانية', subTitle: 'ما حدش فاهم حاجة', image: 'https://i.pinimg.com/originals/81/10/65/811065ec2b2a23351eeef52f211f6d14.jpg', url: 'http://aromatv.co:80/series/aroma-it4k/Yst88773kkh/37797.mp4'),context),
                               onTap: (){
                                 setState(() {
                                   controller.dispose();
                                   textController.text.trim().isEmpty;
                                   textController.text = 'http://aromatv.co:80/series/aroma-it4k/Yst88773kkh/37797.mp4';
                                   controller = VideoPlayerController.network('http://aromatv.co:80/series/aroma-it4k/Yst88773kkh/37797.mp4')
                                     ..addListener(() => setState(() {}))
                                     ..setLooping(true)
                                     ..initialize().then((_) => controller.play());
                                   buildVideo();
                                   buildVideoPlayer();

                                 });
                               },),
                             SizedBox(
                               width: 20.0,
                             ),
                           ],
                         ),
                       ),
                     ),
                   ),
                 ],
               );
         },
        ),
      ),
    );
  }

  Widget buildVideoPlayer() => Container(
     width: double.infinity,
     child: AspectRatio(
       aspectRatio: controller.value.aspectRatio,
       child: VideoPlayer(controller),
     ),
   );


  Widget buildVideo() => Stack(
    children: <Widget>[
      buildVideoPlayer(),
      Positioned.fill(child: BasicOverlayWidget(controller: controller)),
    ],
  );

  Widget buildArticleItem(ArticaleModel articaleModel, context) => Padding(
    padding: const EdgeInsets.only(top: 20,left: 20,right: 20),
    child: Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.0),
        color: Colors.white12,
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Container(
              width: 100.0,
              height: 100.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                image: DecorationImage(
                  image: NetworkImage(
                 '${articaleModel.image}',
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(
              width: 20.0,
            ),

            Column(

              crossAxisAlignment: CrossAxisAlignment.start,

              mainAxisAlignment: MainAxisAlignment.start,

              children: [

                Text(
                  '${articaleModel.title}',
                  style: Theme.of(context).textTheme.bodyText1.copyWith(color: Colors.white),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,

                ),
                SizedBox(
                  height: 16,
                ),
                Text(
                  '${articaleModel.subTitle}',
                  style: TextStyle(

                    color: Colors.grey,

                  ),

                ),

              ],

            ),

          ],

        ),
      ),
    ),

  );

   Widget buildArticleItemLandscape(ArticaleModel articaleModel, context) => Padding(
     padding: const EdgeInsets.only(left: 20,right: 20,),
     child: Container(
       width: 100,
       height: 135,
       decoration: BoxDecoration(
         borderRadius: BorderRadius.circular(6.0),
         color: Colors.white12,
       ),
       child: Column(
         crossAxisAlignment: CrossAxisAlignment.center,
         mainAxisAlignment: MainAxisAlignment.start,
         children: [
           Container(
             height: 80.0,
             decoration: BoxDecoration(
               borderRadius: BorderRadius.circular(6.0),
               image: DecorationImage(
                 image: NetworkImage(
                   '${articaleModel.image}',
                 ),
                 fit: BoxFit.cover,
               ),
             ),
           ),
           Text(
             '${articaleModel.title}',
             textAlign: TextAlign.center,
             style: Theme.of(context).textTheme.bodyText1.copyWith(color: Colors.white,fontSize: 14),
             overflow: TextOverflow.ellipsis,
           ),
           myDivider(),
           Text(
             '${articaleModel.subTitle}',
             textAlign: TextAlign.center,
             style: TextStyle(
               color: Colors.grey,
               fontSize: 12,
             ),

           ),
         ],

       ),
     ),

   );
}

class BasicOverlayWidget extends StatelessWidget {
  final VideoPlayerController controller;

  const BasicOverlayWidget({
    Key key,
    @required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => GestureDetector(
    behavior: HitTestBehavior.opaque,
    onTap: () =>
    controller.value.isPlaying ? controller.pause() : controller.play(),
    child: Stack(
      children: <Widget>[
        buildPlay(),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: buildIndicator(),
        ),
      ],
    ),
  );

  Widget buildIndicator() => VideoProgressIndicator(
    controller,
    allowScrubbing: true,
  );

  Widget buildPlay() => controller.value.isPlaying
      ? Container()
      : Container(
    alignment: Alignment.center,
    color: Colors.black26,
    child: Icon(Icons.play_arrow, color: Colors.white, size: 30),
  );
}
class GetMacAddress {
  static const MethodChannel _channel = const MethodChannel('get_mac');

  static Future<String> get macAddress async {
    final String macID = await _channel.invokeMethod('getMacAddress');
    return macID;
  }
}
