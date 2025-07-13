/// Represent a Product with its details.
class Product {
  final String id;
  final String name;
  final String description;
  final double price;
  final double rating;
  final String imageUrl;

  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.rating,
    required this.imageUrl,
  });
}

sealed class FakeProductList {
  /// A list of fake products to simulate a product catalog.
  static List<Product> products = [
    Product(
      id: 'p1',
      name: 'Wireless Bluetooth Headphones',
      description: 'High-fidelity sound, noise cancellation, 20 hours battery life.',
      price: 59.99,
      rating: 4.5,
      imageUrl: 'https://images.unsplash.com/photo-1628329567705-f8f7150c3cff?q=80&w=870&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    ),
    Product(
      id: 'p2',
      name: 'Smart Fitness Watch',
      description: 'Track your heart rate, sleep, and workouts with this smart wearable.',
      price: 89.99,
      rating: 4.2,
      imageUrl: 'https://images.unsplash.com/photo-1676173647178-e8bfdc144d76?q=80&w=387&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    ),
    Product(
      id: 'p3',
      name: 'Portable Bluetooth Speaker',
      description: 'Waterproof speaker with powerful bass and 12 hours playtime.',
      price: 39.99,
      rating: 4.6,
      imageUrl: 'https://images.unsplash.com/photo-1667543239992-85092e7f2f72?q=80&w=387&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    ),
    Product(
      id: 'p4',
      name: 'Gaming Mouse with RGB Lighting',
      description: 'Ergonomic design, 6 programmable buttons, customizable DPI.',
      price: 29.99,
      rating: 4.3,
      imageUrl: 'https://images.unsplash.com/photo-1627745214193-2bcefc681524?q=80&w=465&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    ),
    Product(
      id: 'p5',
      name: '4K Ultra HD Monitor',
      description: 'Stunning visuals, 27-inch screen with ultra-thin bezels.',
      price: 299.99,
      rating: 4.8,
      imageUrl: 'https://images.unsplash.com/photo-1587825140708-dfaf72ae4b04?auto=format&fit=crop&w=800&q=60',
    ),
  ];
}
