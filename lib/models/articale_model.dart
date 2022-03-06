import 'package:flutter/material.dart';

class ArticaleModel {

  final int id;
  final String title;
  final String subTitle;
  final String image;
  final String url;

  ArticaleModel({
    @required this.id,
    @required this.title,
    @required this.subTitle,
    @required this.image,
    @required this.url,
  });

}