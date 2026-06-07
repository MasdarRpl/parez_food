class Restaurant {
  final String id;
  final String name;
  final String category;
  final double rating;
  final double distance;
  final int discount;
  final bool isPro;
  final String imageUrl;
  final String deliveryTime;
  final int priceMin;

  Restaurant({
    required this.id,
    required this.name,
    required this.category,
    required this.rating,
    required this.distance,
    required this.discount,
    required this.isPro,
    required this.imageUrl,
    required this.deliveryTime,
    required this.priceMin,
  });
}

class MenuItem {
  final String id;
  final String name;
  final String restaurantId;
  final double price;
  final double rating;
  final String imageUrl;
  final String description;

  MenuItem({
    required this.id,
    required this.name,
    required this.restaurantId,
    required this.price,
    required this.rating,
    required this.imageUrl,
    required this.description,
  });
}