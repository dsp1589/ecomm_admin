
import 'package:ecomm_admin/misc/string_constants.dart';
import 'package:ecomm_admin/misc/ui_constants.dart';
import 'package:ecomm_admin/models/form_field.dart';
import 'package:ecomm_admin/widgets/form/field.dart';
import 'package:flutter/material.dart';

//Wrapper forf fields
class FormWidget extends StatefulWidget{

  final List<FormItem> fields;

  FormWidget(this.fields);

  @override
  State<StatefulWidget> createState() {
    return _FormWidgetState();
  }
}

class _FormWidgetState extends State<FormWidget>{
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Form(
        key: _formKey,
        child: Padding(child: Column(
            children: _buildForms()
        ), padding: EdgeInsets.only(left: UIConstants.STANDARD_MARGIN, right:  UIConstants.STANDARD_MARGIN),),
    ), top: true,);
  }

  //custom form fields for dynamically building forms from rest response
  List<Widget> _buildForms(){
    List<Widget> items = [];
    items.addAll(widget.fields.map((e) => CustomFormField(e, validator: (inp){
      if(e.mandatory && (inp == null || inp == "")){
        return e.validationMessage;
      }
      return null;
    },),).toList());
    items.add(RaisedButton(
        onPressed: () {
          _formKey.currentState.save();
          if (_formKey.currentState.validate()) {
            showDialog(context: this.context, builder: (_C){
              return AlertDialog(title: Text(StringConstants.SUCCESS), content: Text(StringConstants.ITEM_ADDED_SUCCESSFULLY),);
            });
          }
        },
        child: Text(StringConstants.SAVE),
      ));
    return items;
  }
}