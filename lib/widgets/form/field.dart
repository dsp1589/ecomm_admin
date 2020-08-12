import 'package:ecomm_admin/models/form_field.dart';
import 'package:flutter/material.dart';


class CustomFormField extends FormField {

  final FormItem item;
  CustomFormField(this.item, {FormFieldValidator<dynamic> validator, FormFieldSetter<dynamic> onSaved}): super(
      autovalidate: false,
      onSaved: onSaved,
      validator: validator,
      initialValue: null,
      builder: (state) {
        return FormFieldWidget(state, item);
      });
}


class FormFieldWidget extends StatefulWidget{

  final FormFieldState _state;
  final FormItem item;
  FormFieldWidget(this._state, this.item);

  @override
  State<StatefulWidget> createState() {
    return _FormFieldWidgetState();
  }
}

class _FormFieldWidgetState extends State<FormFieldWidget>{

  TextEditingController _controller = new TextEditingController();
  bool checked = false;

  @override
  Widget build(BuildContext context) {
    Widget w;
    switch(widget.item.type){
      case "text":
        _controller.text = widget._state.value ?? widget.item.defaultValue;
        widget._state.setValue(widget.item.defaultValue);
          w = TextField(controller: _controller, onChanged: (str){
                widget._state.setValue(str);
          },decoration: InputDecoration(errorMaxLines: 2, errorText: widget._state.errorText, labelText: widget.item.caption),);
        break;
      case "int":
        _controller.text = widget._state.value ?? widget.item.defaultValue;
        widget._state.setValue(widget.item.defaultValue);
        w = TextField(controller: _controller, keyboardType: TextInputType.numberWithOptions(), onChanged: (str){
          widget._state.setValue(str);
        }, onEditingComplete: (){
          widget._state.didChange(_controller.text.trim());
        },);
        break;
      case "bool":
        if(widget.item.defaultValue == "False"){
          widget._state.setValue(false);
        }
        w = Row(children: [Text(widget.item.caption),Checkbox(value: checked, onChanged: (val){
          widget._state.setValue(val);
          setState(() {
            checked = val;
          });
        })], mainAxisAlignment: MainAxisAlignment.spaceBetween,);
        break;
    }
    return w == null ? Container() : w;
  }

}