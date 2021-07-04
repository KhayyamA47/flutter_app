import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_app/model/options.dart';
import 'package:flutter_app/util/constants.dart';
import 'package:flutter_app/util/mainUtil.dart';
import 'package:flutter_app/util/text.dart';
import 'package:flutter_app/util/textField.dart';

class SlidingHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: SizeConfig.size8),
      height: SizeConfig.size8 * 0.5,
      width: SizeConfig.size20 * 2,
      decoration: BoxDecoration(
        color: Constants.slidingHeader,
        borderRadius: BorderRadius.all(Radius.circular(SizeConfig.size8)),
      ),
    );
  }
}

// ignore: must_be_immutable
class GridList extends StatefulWidget {
  int selected;
  final Options options;

  GridList({Key key, this.selected, this.options}) : super(key: key);

  @override
  _GridListItemState createState() => _GridListItemState(selected, options);
}

class _GridListItemState extends State<GridList> {
  Options options;
  int selected;

  _GridListItemState(this.selected, this.options);

  @override
  Widget build(BuildContext context) {
    return  MediaQuery.removePadding(
      removeTop: true,
      removeBottom: true,
      context: context,
      child: GridView.builder(
          padding: EdgeInsets.only(top: SizeConfig.size10),
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: SizeConfig.screenHeight /600 ,
              crossAxisSpacing: SizeConfig.size12 * 0.5,
              mainAxisSpacing: SizeConfig.size12 * 0.5),
          itemCount: options.data.length,
          itemBuilder: (BuildContext context, int index) {
            return InkWell(
              child: Container(

                padding: EdgeInsets.all(SizeConfig.size14),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      padding: EdgeInsets.all(SizeConfig.size8*0.6),
                      width: SizeConfig.screenHeight /23,
                      height: SizeConfig.screenHeight /23,
                      decoration: BoxDecoration(
                          color: index == selected
                              ? Colors.white38
                              : Colors.white,
                          borderRadius:
                          BorderRadius.circular(SizeConfig.size10)),
                      child: Image.network(options.data[index].path,
                          color: index == selected
                              ? Colors.white
                              : Color(0xff0180ff)),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextWidget(
                            textAlign: TextAlign.left,
                            maxLines: 1,
                            textColor: index == selected
                                ? Constants.whiteTextColor
                                : Constants.blackTextColor,
                            text: options.data[index].placeName,
                            fontSize: SizeConfig.size12,
                            fontWeight: FontWeight.w700,
                            letterSpacing: 0.2),
                        SizedBox(height: SizeConfig.size8 * 0.5),
                        TextWidget(
                            textAlign: TextAlign.left,
                            maxLines: 1,
                            textColor: index == selected
                                ? Constants.whiteTextColor
                                : Constants.lightTextColor,
                            text: options.data[index].address,
                            fontSize: SizeConfig.size8,
                            fontWeight: FontWeight.w700,
                            letterSpacing: 0.2),
                      ],
                    ),
                  ],
                ),
                decoration: BoxDecoration(
                    color: index == selected
                        ? Colors.amber
                        : Constants.inputAndListItemColor,
                    borderRadius: BorderRadius.circular(SizeConfig.size12)),
              ),
              onTap: () {
                setState(() {
                  selected = index;
                  log(selected.toString());
                });
              },
            );
          }),
    );
  }
}

class InputAndButton extends StatelessWidget {
  final TextEditingController controller;

  const InputAndButton({Key key, this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Expanded(
              child: Container(
                alignment: Alignment.bottomCenter,
                height: SizeConfig.textFieldHeight,
                child: TextFieldWidget(
                  fillColor: Constants.inputAndListItemColor,
                  hint: "Where to?",
                  prefix: Icon(Icons.search, color: Constants.textFiledPrefixColor),
                  isEnabled: true,
                  fontSize: SizeConfig.size10,
                  obscureText: false,
                  hintColor: Constants.hintColor,
                  textInputType: TextInputType.emailAddress,
                  textEditingController: controller,
                ),
              )),
          SizedBox(width: SizeConfig.size8),
          InkWell(
            child: Container(
                height: SizeConfig.size16 * 2,
                width: SizeConfig.screenWidth * 0.17,
                decoration: BoxDecoration(
                  border:
                  Border.all(color: Constants.textFieldColor, width: 1.0),
                  borderRadius:
                  new BorderRadius.all(Radius.circular(SizeConfig.size12)),
                ),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(
                        Icons.watch_later,
                        color: Constants.nowButtonIconColor,
                        size: SizeConfig.size16,
                      ),
                      TextWidget(
                          textAlign: TextAlign.left,
                          maxLines: 1,
                          textColor: Constants.blackTextColor,
                          text: 'Now',
                          fontSize: SizeConfig.size10,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 0.2),
                    ])),
            onTap: () {

            },
          )
        ]);
  }
}
