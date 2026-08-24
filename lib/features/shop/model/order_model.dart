import 'package:ecommerce_admin_panel/utils/constants/enums.dart';
import 'package:ecommerce_admin_panel/utils/helpers/helper.dart';

class OrderModel {
  String id;
  String? userId;
  String? docId;
  OrderStatus status;
  double totalAmount;
  DateTime orderDate;
  DateTime? deliveryDate;
  String? paymentMethod;
  OrderModel({
    required this.id,
    required this.status,
    required this.totalAmount,
    required this.orderDate,
    this.deliveryDate,
    this.paymentMethod = 'Paypal',
  });

  String get formattedOrderDate => THelperFunctions.getFormattedDate(orderDate);
  String get formattedDeliveryDate =>
      deliveryDate != null ? THelperFunctions.getFormattedDate(orderDate) : '';
  String get orderStatusText => status == OrderStatus.delivered
      ? 'Delivered'
      : status == OrderStatus.shipped
      ? 'Shippment on the way'
      : 'Processing';

  static OrderModel empty() => OrderModel(
    id: '',
    status: OrderStatus.pending,
    totalAmount: 0,
    orderDate: DateTime.now(),
  );
}
