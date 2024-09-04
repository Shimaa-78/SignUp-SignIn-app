import 'package:flutter/material.dart';

class OnBoardinModel {
  String imgpath;
  String title;
  String text;
  OnBoardinModel(
      {required this.imgpath, required this.text, required this.title});
}

List<OnBoardinModel> Items = [
  OnBoardinModel(
      imgpath: "assets/images/img1.png",
      title: "Make your own private travel plan",
      text: "Formulate your strategy to receive wonderful gift packs"),

  OnBoardinModel(
      imgpath: "assets/images/img3.png",
      title: "High-end leisure projects to choose from",
      text: "The world's first-class modern leisure and entertainment method"),
];
