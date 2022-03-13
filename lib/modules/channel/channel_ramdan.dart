import 'package:apex3/home_layout.dart';
import 'package:apex3/models/articale_model.dart';
import 'package:apex3/modules/web_view/web_view_screen.dart';
import 'package:apex3/shared/components/components.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ChannelRamadan extends StatefulWidget {

  @override
  State<ChannelRamadan> createState() => _ChannelRamadanState();
}

class _ChannelRamadanState extends State<ChannelRamadan> {
  @override
  Widget build(BuildContext context) {
    List<ArticaleModel> list = [
      ArticaleModel(id: 1, title: 'سلمات أبو البنات', subTitle: 'سلمات أبو البنات 1', image: 'https://image.tmdb.org/t/p/w600_and_h900_bestv2/pB37xoByjkVkxHiobVC7DNwXDFp.jpg', url: 'http://aromatv.co:80/series/aroma-it4k/Yst88773kkh/129640.mp4'),
      ArticaleModel(id: 2, title: 'سلمات أبو البنات', subTitle: 'سلمات أبو البنات 2', image: 'https://image.tmdb.org/t/p/w600_and_h900_bestv2/pB37xoByjkVkxHiobVC7DNwXDFp.jpg', url: 'http://aromatv.co:80/series/aroma-it4k/Yst88773kkh/129641.mp4'),
      ArticaleModel(id: 3, title: 'سلمات أبو البنات', subTitle: 'سلمات أبو البنات 3', image: 'https://image.tmdb.org/t/p/w600_and_h900_bestv2/pB37xoByjkVkxHiobVC7DNwXDFp.jpg', url: 'http://aromatv.co:80/series/aroma-it4k/Yst88773kkh/129642.mp4'),
      ArticaleModel(id: 4, title: 'سلمات أبو البنات', subTitle: 'سلمات أبو البنات 4', image: 'https://image.tmdb.org/t/p/w600_and_h900_bestv2/pB37xoByjkVkxHiobVC7DNwXDFp.jpg', url: 'http://aromatv.co:80/series/aroma-it4k/Yst88773kkh/129643.mp4'),
      ArticaleModel(id: 5, title: 'سلمات أبو البنات', subTitle: 'سلمات أبو البنات 5', image: 'https://image.tmdb.org/t/p/w600_and_h900_bestv2/pB37xoByjkVkxHiobVC7DNwXDFp.jpg', url: 'http://aromatv.co:80/series/aroma-it4k/Yst88773kkh/129644.mp4'),
      ArticaleModel(id: 6, title: 'سلمات أبو البنات', subTitle: 'سلمات أبو البنات 6', image: 'https://image.tmdb.org/t/p/w600_and_h900_bestv2/pB37xoByjkVkxHiobVC7DNwXDFp.jpg', url: 'http://aromatv.co:80/series/aroma-it4k/Yst88773kkh/129645.mp4'),
      ArticaleModel(id: 7, title: 'سلمات أبو البنات', subTitle: 'سلمات أبو البنات 7', image: 'https://image.tmdb.org/t/p/w600_and_h900_bestv2/pB37xoByjkVkxHiobVC7DNwXDFp.jpg', url: 'http://aromatv.co:80/series/aroma-it4k/Yst88773kkh/129646.mp4'),
    ];
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
            style: Theme.of(context).textTheme.bodyText1!.copyWith(
                fontFamily: 'Jannah',
                color: Colors.white
            ),
          ),
          centerTitle: true,
          leading: Tab(
            icon: InkWell(
                child: Container(
                    height: 30,
                    width: 30,
                    child: Icon(Icons.arrow_back_ios,color: Colors.white,size: 18,)),
              onTap: () => Navigator.pop(context),
            ),
          ),
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
    builder: (context, orientation) {
      return orientation == Orientation.portrait
          ? Padding(
        padding: EdgeInsets.all(8),
        child: GridView.count(
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          // physics: NeverScrollableScrollPhysics(),
          crossAxisCount: 2,
          mainAxisSpacing: 16.0,
          crossAxisSpacing: 15.0,
          children:  List.generate(
            list.length,
                (index) => InkWell(child: buildArticleItemLandscape(list[index],context),


                  onTap: ()
              {
                navigateTo(context, WebViewScreen('http://aromatv.co:80/series/aroma-it4k/Yst88773kkh/37797.mp4'),);
              },
            ),
          ),
        ),
      )
          : Padding(
        padding: EdgeInsets.all(8),
        child: GridView.count(
            shrinkWrap: true,
            // physics: NeverScrollableScrollPhysics(),
            crossAxisCount: 5,
             mainAxisSpacing: 16.0,
            crossAxisSpacing: 15.0,

          children:  List.generate(
               list.length,
                (index) => InkWell(child: buildArticleItemLandscape(list[index],context),
        onTap: ()
        {
        navigateTo(context, ChannelRamadan());
         navigateTo(context, WebViewScreen(list[index].url!),);
        },
          ),
        ),
        ),
      );
    },
        ),

      ),
    );
  }

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
            style: Theme.of(context).textTheme.bodyText1!.copyWith(color: Colors.white,fontSize: 14),
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
