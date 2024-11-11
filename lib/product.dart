class Product {
  final String name;
  final String imagePath;
  final double price;
  final String description;
  final int rating;
  final int reviews;
  final List<Review> reviewsList;  // Daftar ulasan produk
  int quantity;
  String status;

  Product({
    required this.name,
    required this.imagePath,
    required this.price,
    required this.description,
    required this.rating,
    required this.reviews,
    required this.reviewsList,
    this.quantity = 1,
    this.status = 'Pending',  
  });
}

class Review {
  final String username;
  final int rating;  // Rating dalam bentuk angka (1-5)
  final String comment;  // Komentar ulasan

  Review({required this.username, required this.rating, required this.comment});
}
