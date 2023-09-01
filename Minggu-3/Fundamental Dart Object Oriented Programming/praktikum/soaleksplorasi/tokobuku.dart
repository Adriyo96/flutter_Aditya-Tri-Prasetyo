class Book {
  int id;
  String title;
  String publisher;
  double price;
  String category;

  Book(this.id, this.title, this.publisher, this.price, this.category);

  @override
  String toString() {
    return 'ID: $id, Judul: $title, Penerbit: $publisher, Harga: $price, Kategori: $category';
  }
}

class BookStore {
  List<Book> books = [];
  int _nextId = 1;

  // Method untuk menambahkan buku baru
  void addBook(String title, String publisher, double price, String category) {
    Book book = Book(_nextId, title, publisher, price, category);
    books.add(book);
    _nextId++;
  }

  // Method untuk mendapatkan semua data buku
  List<Book> getAllBooks() {
    return books;
  }

  // Method untuk menghapus buku berdasarkan ID
  void deleteBook(int id) {
    books.removeWhere((book) => book.id == id);
  }
}

void main() {
  BookStore bookStore = BookStore();

  // Menambahkan beberapa buku ke toko buku
  bookStore.addBook("Dilan 1990", "A", 60.0, "Romance");
  bookStore.addBook("Harry Potter", "B", 75.0, "Fiction");
  bookStore.addBook("One Piece", "C", 45.0, "Adventure");

  // Mendapatkan dan menampilkan semua data buku
  List<Book> allBooks = bookStore.getAllBooks();
  print("Daftar Semua Buku:");
  for (var book in allBooks) {
    print(book);
  }

  // Menghapus buku berdasarkan ID
  int bookIdToDelete = 1;
  bookStore.deleteBook(bookIdToDelete);
  print("\nBuku dengan ID $bookIdToDelete telah dihapus.");

  // Mendapatkan dan menampilkan semua data buku setelah penghapusan
  allBooks = bookStore.getAllBooks();
  print("\nDaftar Semua Buku Setelah Penghapusan:");
  for (var book in allBooks) {
    print(book);
  }
}