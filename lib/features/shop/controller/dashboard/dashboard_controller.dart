import 'package:ecommerce_admin_panel/features/shop/model/order_model.dart';
import 'package:ecommerce_admin_panel/utils/constants/enums.dart';
import 'package:ecommerce_admin_panel/utils/helpers/helper.dart';
import 'package:get/get.dart';

class DashboardController extends GetxController {
  static DashboardController get instance => Get.find();

  final RxList<double> weeklySales = <double>[].obs;
  final RxMap<OrderStatus, int> orderStatusData = <OrderStatus, int>{}.obs;
  final RxMap<OrderStatus, double> totalAmounts = <OrderStatus, double>{}.obs;

  ///Order
  static final List<OrderModel> orders = [
    // Monday
    OrderModel(
      id: 'CWT001',
      status: OrderStatus.pending,
      totalAmount: 150,
      orderDate: DateTime.now().subtract(
        Duration(days: DateTime.now().weekday - 1),
      ),
      deliveryDate: DateTime.now().add(const Duration(days: 2)),
    ),

    OrderModel(
      id: 'CWT002',
      status: OrderStatus.processing,
      totalAmount: 265,
      orderDate: DateTime.now().subtract(
        Duration(days: DateTime.now().weekday - 1),
      ),
      deliveryDate: DateTime.now().add(const Duration(days: 3)),
    ),

    // Tuesday
    OrderModel(
      id: 'CWT003',
      status: OrderStatus.shipped,
      totalAmount: 369,
      orderDate: DateTime.now().subtract(
        Duration(days: DateTime.now().weekday - 2),
      ),
      deliveryDate: DateTime.now().add(const Duration(days: 1)),
    ),

    // Wednesday
    OrderModel(
      id: 'CWT004',
      status: OrderStatus.delivered,
      totalAmount: 450,
      orderDate: DateTime.now().subtract(
        Duration(days: DateTime.now().weekday - 3),
      ),
      deliveryDate: DateTime.now(),
    ),

    OrderModel(
      id: 'CWT005',
      status: OrderStatus.cancelled,
      totalAmount: 120,
      orderDate: DateTime.now().subtract(
        Duration(days: DateTime.now().weekday - 3),
      ),
      deliveryDate: DateTime.now(),
    ),

    // Thursday
    OrderModel(
      id: 'CWT006',
      status: OrderStatus.processing,
      totalAmount: 520,
      orderDate: DateTime.now().subtract(
        Duration(days: DateTime.now().weekday - 4),
      ),
      deliveryDate: DateTime.now().add(const Duration(days: 2)),
    ),

    // Friday
    OrderModel(
      id: 'CWT007',
      status: OrderStatus.shipped,
      totalAmount: 680,
      orderDate: DateTime.now().subtract(
        Duration(days: DateTime.now().weekday - 5),
      ),
      deliveryDate: DateTime.now().add(const Duration(days: 1)),
    ),

    // Saturday
    OrderModel(
      id: 'CWT008',
      status: OrderStatus.delivered,
      totalAmount: 350,
      orderDate: DateTime.now().subtract(
        Duration(days: DateTime.now().weekday - 6),
      ),
      deliveryDate: DateTime.now(),
    ),

    // Sunday
    OrderModel(
      id: 'CWT009',
      status: OrderStatus.pending,
      totalAmount: 220,
      orderDate: DateTime.now().subtract(
        Duration(days: DateTime.now().weekday - 7),
      ),
      deliveryDate: DateTime.now().add(const Duration(days: 4)),
    ),
  ];

  @override
  void onInit() {
    super.onInit();
    _calculateWeeklySales();
    _calculateOrderStatusData();
  }

  //calculate weekly sales
  void _calculateWeeklySales() {
    //Reset weeklySales to zeros
    weeklySales.value = List<double>.filled(7, 0.0);

    for (var order in orders) {
      final DateTime orderWeekStart = THelperFunctions.getStartOfWeek(
        order.orderDate,
      );
      //Check if the order is within the current week
      if (orderWeekStart.isBefore(DateTime.now()) &&
          orderWeekStart.add(const Duration(days: 7)).isAfter(DateTime.now())) {
        int index = (order.orderDate.weekday - 1) % 7;
        //Ensure the index is non negative
        index = index < 0 ? index + 7 : index;
        weeklySales[index] += order.totalAmount;
        print(
          'orderDate: ${order.orderDate}, currentWeekDay: $orderWeekStart, Index:$index',
        );
      }
    }

    print('Weekly Sales: $weeklySales');
  }

  void _calculateOrderStatusData() {
    //Reset status data
    orderStatusData.clear();

    //Map to store total Amount for each status
    totalAmounts.value = {for (var status in OrderStatus.values) status: 0.0};

    for (var order in orders) {
      //Count Orders
      final status = order.status;
      orderStatusData[status] = (orderStatusData[status] ?? 0) + 1;

      //calculated total amount\
      totalAmounts[status] = (totalAmounts[status] ?? 0) + order.totalAmount;
    }
  }
}
