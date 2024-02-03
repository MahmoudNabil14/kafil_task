// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'service_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ServiceResponseModel _$ServiceResponseModelFromJson(
        Map<String, dynamic> json) =>
    ServiceResponseModel(
      status: json['status'] as int,
      success: json['success'] as bool,
      services: (json['data'] as List<dynamic>)
          .map((e) => Service.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ServiceResponseModelToJson(
        ServiceResponseModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'success': instance.success,
      'data': instance.services,
    };

Service _$ServiceFromJson(Map<String, dynamic> json) => Service(
      id: json['id'] as int,
      mainImage: json['main_image'] as String,
      title: json['title'] as String,
      price: json['price'] as int,
      discount: json['discount'] as int?,
      priceAfterDiscount: json['price_after_discount'] as int,
      averageRating: json['average_rating'] as int,
      completedSalesCount: json['completed_sales_count'] as int,
      recommended: json['recommended'] as bool,
    );

Map<String, dynamic> _$ServiceToJson(Service instance) => <String, dynamic>{
      'id': instance.id,
      'main_image': instance.mainImage,
      'title': instance.title,
      'price': instance.price,
      'discount': instance.discount,
      'price_after_discount': instance.priceAfterDiscount,
      'average_rating': instance.averageRating,
      'completed_sales_count': instance.completedSalesCount,
      'recommended': instance.recommended,
    };
