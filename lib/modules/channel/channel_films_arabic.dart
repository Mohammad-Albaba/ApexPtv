import 'package:apex3/home_layout.dart';
import 'package:apex3/models/articale_model.dart';
import 'package:apex3/modules/web_view/web_view_screen.dart';
import 'package:apex3/shared/components/components.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ChannelFilmsArabic extends StatefulWidget {

  @override
  State<ChannelFilmsArabic> createState() => _ChannelFilmsArabicState();
}

class _ChannelFilmsArabicState extends State<ChannelFilmsArabic> {
  List<ArticaleModel> list = [
  ArticaleModel(id: 1, title: 'أفلام عربية حديثه', subTitle: 'من اجل زيكو', image: 'https://image.tmdb.org/t/p/w600_and_h900_bestv2/vbIG1u31qzyLMtnMU29R1SKbG6O.jpg', url: 'http://aromatv.co:80/movie/aroma-it4k/Yst88773kkh/214521.mp4'),
  ArticaleModel(id: 2, title: 'أفلام عربية حديثه', subTitle: 'عروستي', image: 'https://image.tmdb.org/t/p/w600_and_h900_bestv2/iEGkIeGXZkwvUKvvEXuDwp0mfVx.jpg', url: 'http://aromatv.co:80/movie/aroma-it4k/Yst88773kkh/218922.mp4'),
  ArticaleModel(id: 3, title: 'أفلام عربية حديثه', subTitle: 'اصحاب ولا اعز', image: 'https://media.elcinema.com/uploads/_315x420_a129d2b7b500dbe54a56111b74a2257b7c9c6f819b9d3e9129173ff0710298a8.jpg', url: 'http://aromatv.co:80/movie/aroma-it4k/Yst88773kkh/213639.mp4'),
  ArticaleModel(id: 4, title: 'أفلام عربية حديثه', subTitle: 'كبرو و مبغاوش يخويو الدار', image: 'https://media.elcinema.com/uploads/_315x420_777be986c5c8788481102567dc9a566704adbc3f80a887adfa3cada75e3bc0d0.jpg', url: 'http://aromatv.co:80/movie/aroma-it4k/Yst88773kkh/205856.mp4'),
  ArticaleModel(id: 5, title: 'أفلام عربية حديثه', subTitle: 'الصقر شيمة', image: 'https://mycima.ws:2096/wp-content/uploads/2021/11/%D9%81%D9%8A%D9%84%D9%85-%D8%A7%D9%84%D8%B5%D9%82%D8%B1-%D8%B4%D9%8A%D9%85%D8%A9.jpg', url: 'http://aromatv.co:80/movie/aroma-it4k/Yst88773kkh/201709.mp4'),
  ArticaleModel(id: 6, title: 'أفلام عربية حديثه', subTitle: 'ماما حامل', image: 'https://image.tmdb.org/t/p/w600_and_h900_bestv2/c79gxPvnRQjP4kWvPEmSblpTy6G.jpg', url: 'http://aromatv.co:80/movie/aroma-it4k/Yst88773kkh/186452.mp4'),
  ArticaleModel(id: 7, title: 'أفلام عربية حديثه', subTitle: 'الى السماء', image: 'https://image.tmdb.org/t/p/w600_and_h900_bestv2/mDna51F8QfrJFZOgPGQUz3VKqsB.jpg', url: 'http://aromatv.co:80/movie/aroma-it4k/Yst88773kkh/185595.mp4'),
  ];
  @override
  Widget build(BuildContext context) {
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
                navigateTo(context, WebViewScreen(list[index].url!),);
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
        navigateTo(context, ChannelFilmsArabic());
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
