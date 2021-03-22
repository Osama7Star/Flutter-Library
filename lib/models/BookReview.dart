class BookReviews {
  String review;
  String date;
  String name;
  String userName;
  String imageUrl;

  BookReviews(
      {this.review, this.date, this.name, this.userName, this.imageUrl});
}

List<BookReviews> bookReviewsDemo = [
  BookReviews(
      review: "هذا الكتاب رائع",
      date: "12-3-2021",
      name: "أسامة النجم",
      userName: "osama7star",
      imageUrl:
          'https://cdn02.plentymarkets.com/4n91gk7bomyj/item/images/124582293/full/--------------------------------------------------------------------------01.jpg'),
  BookReviews(
      review: "هذا الكتاب رائع",
      date: "12-3-2021",
      name: "أسامة النجم",
      userName: "osama7star",
      imageUrl:
          'https://cdn02.plentymarkets.com/4n91gk7bomyj/item/images/124582293/full/--------------------------------------------------------------------------01.jpg'),
];
