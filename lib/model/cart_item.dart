class CartItem {
  final String id;
  final String productName;
  final double price;
  int quantity; // Mutable quantity

  CartItem({
    required this.id,
    required this.productName,
    required this.price,
    this.quantity = 1, // Default quantity
  });
}
