import 'package:freezed_annotation/freezed_annotation.dart';

part 'customer.freezed.dart';
part 'customer.g.dart';

@freezed
abstract class Customer with _$Customer {
  const factory Customer({
    required String id,
    required String nickname,
    required DateTime createdAt,
  }) = _Customer;

  factory Customer.fromJson(Map<String, Object?> json) =>
      _$CustomerFromJson(json);
}
