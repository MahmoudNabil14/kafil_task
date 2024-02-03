import 'package:freezed_annotation/freezed_annotation.dart';
part 'service_response_model.g.dart';

@JsonSerializable()
class ServiceResponseModel {
  final int status;
  final bool success;
  @JsonKey(name: 'data')
  final List<Service> services;

  ServiceResponseModel({required this.status, required this.success, required this.services});

  factory ServiceResponseModel.fromJson(Map<String, dynamic> json) => _$ServiceResponseModelFromJson(json);

}

@JsonSerializable()
class Service{
  final int id;
  @JsonKey(name: 'main_image')
  final String mainImage;
  final String title;
  final int price;
  final int? discount;
  @JsonKey(name: 'price_after_discount')
  final int priceAfterDiscount;
  @JsonKey(name: 'average_rating')
  final int averageRating;
  @JsonKey(name: 'completed_sales_count')
  final int completedSalesCount;
  final bool recommended;

  Service({required this.id, required this.mainImage,  required this.title, required this.price, required this.discount, required this.priceAfterDiscount, required this.averageRating, required this.completedSalesCount, required this.recommended});
  factory Service.fromJson(Map<String, dynamic> json) => _$ServiceFromJson(json);

}
