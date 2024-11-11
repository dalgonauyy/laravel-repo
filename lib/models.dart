// Buat file baru models.dart (opsional)
class Product {
  final String gambar;
  final String nama;
  final String deskripsi;
  final String harga;

  Product({
    required this.gambar,
    required this.nama,
    required this.deskripsi,
    required this.harga,
  });
}

class CartItem {
  final Product product;
  int quantity;

  CartItem({
    required this.product,
    this.quantity = 1,
  });
}
