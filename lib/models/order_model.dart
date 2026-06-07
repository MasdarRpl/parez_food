class OrderItem {
  final String id;
  final String name;
  final double price;
  int quantity;
  final String restaurantId;
  final String imageUrl;

  OrderItem({
    required this.id,
    required this.name,
    required this.price,
    required this.quantity,
    required this.restaurantId,
    required this.imageUrl,
  });
}

class Order {
  final String id;
  final List<OrderItem> items;
  final double totalPrice;
  final DateTime orderDate;
  final String status; // 'pending', 'confirmed', 'delivered', 'completed'
  final String restaurantName;

  Order({
    required this.id,
    required this.items,
    required this.totalPrice,
    required this.orderDate,
    required this.status,
    required this.restaurantName,
  });
}