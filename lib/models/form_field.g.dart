// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'form_field.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FormItem _$FormFieldFromJson(Map<String, dynamic> json) {
  return FormItem(
    json['caption'] as String,
    json['type'] as String,
    json['mandatory'] as bool,
    json['defaultValue'] as String,
    json['validationMessage'] as String,
  );
}

Map<String, dynamic> _$FormFieldToJson(FormItem instance) => <String, dynamic>{
      'caption': instance.caption,
      'type': instance.type,
      'mandatory': instance.mandatory,
      'defaultValue': instance.defaultValue,
      'validationMessage': instance.validationMessage,
    };
