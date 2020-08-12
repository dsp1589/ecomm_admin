import 'package:json_annotation/json_annotation.dart';

part 'form_field.g.dart';

@JsonSerializable(nullable:false)
class FormItem{
  final String caption;
  final String type;
  final bool mandatory;
  final String defaultValue;
  final String validationMessage;

  FormItem(this.caption, this.type, this.mandatory, this.defaultValue,
      this.validationMessage);

  factory FormItem.fromJson(Map<String, dynamic> json) => _$FormFieldFromJson(json);
  Map<String, dynamic> toJson() => _$FormFieldToJson(this);
}