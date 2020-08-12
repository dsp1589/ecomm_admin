import 'package:ecomm_admin/misc/ui_constants.dart';
import 'package:flutter/material.dart';


class UIHelper{
  static Widget spacer({double vertical = 0.0, double horizontal = 0.0}){
    return SizedBox(width: horizontal, height: vertical,);
  }

  static  Widget getLoading() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[Text("Loading..."), spacer(vertical: UIConstants.STANDARD_MARGIN) ,CircularProgressIndicator()],
      ),
    );
  }
}