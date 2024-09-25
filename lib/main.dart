// ignore_for_file: avoid_print

class Book {
  String title;
  String author;
  int publicationYear;
  int pagesRead;
  static int totalBooks = 0;

  Book({
    required this.title,
    required this.author,
    required this.publicationYear,
    this.pagesRead = 0,
  }) {
    totalBooks++;
  }

  void read(int pages) {
    pagesRead += pages;
  }

  int getPagesRead() => pagesRead;
  String getTitle() => title;
  String getAuthor() => author;
  int getPublicationYear() => publicationYear;
  int getBookAge() => DateTime.now().year - publicationYear;

  @override
  String toString() {
    return 'title:$title,author:$author,publicationYear:$publicationYear,pagesRead:$pagesRead';
  }
}

void main() {
  Book book1 =
      Book(title: '1984', author: 'George Orwell', publicationYear: 1949);
  Book book2 = Book(
      title: 'To Kill a Mockingbird',
      author: 'Harper Lee',
      publicationYear: 1960);
  Book book3 = Book(title: '1970', author: 'Tom', publicationYear: 2003);

  book1.read(80);
  book2.read(150);
  book3.read(120);

  for (var book in [book1, book2, book3]) {
    print(book.toString());
    print('Book age: ${book.getBookAge()} years.');
    print('----------------------------------');
  }
  print('The total number of books: ${Book.totalBooks}');
}
