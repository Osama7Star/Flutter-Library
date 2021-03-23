import 'package:flutter/material.dart';
import 'package:flutter_library_new/Screens/Authors/AuthorInformation.dart';
import 'package:flutter_library_new/Screens/Main/components/BookPage.dart';
import 'package:flutter_library_new/Screens/authentication/signup/components/sign_form.dart';
import 'package:flutter_library_new/components/components.dart';
import 'package:flutter_library_new/models/BookModel.dart';
import 'package:flutter_library_new/models/BookReview.dart';
import 'package:flutter_library_new/utilites/constants.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class BookInfo extends StatefulWidget {
  @override
  _BookInfoState createState() => _BookInfoState();
}

class _BookInfoState extends State<BookInfo> {
  double _rating = 0;

  final _formKey = GlobalKey<FormState>();

  double userAdedRate = 0;
  String review;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar11(context),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    BookDetailsW(),
                    SizedBox(height: 20,),
                    LabelW(text:'تقييمات القراء',width:double.infinity),
                    SizedBox(height: 10,),

                    ...List.generate(
                        bookReviewsDemo.length,
                        (index) => BookReviews1(
                              bookReviews: bookReviewsDemo[index],
                            )),
                    AddReviewW(),
                    SizedBox(height: 20),
                    LabelW(text:"كتب مشابهة",width: double.infinity,),
                    SizedBox(height: 10),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          ...List.generate(
                              bookDemo.length,
                              (index) =>
                                  OnebookWidget(bookModel: bookDemo[index]))
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }

  Card AddReviewW() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Form(
                key: _formKey,
                child: Column(
                  children: [
                    NameInputField(
                        hint: "أضف مراجعة",
                        minChar: 5,
                        emptyErroMessage: "إكتب شيئاً",
                        lengehtErroMessage: "الإسم يجب أن يكون أكثر من 3  أحرف",
                        icon: Icons.add,
                        couldBeEmpty:true
                    ),
                    SizedBox(height: 10),
                    RatingBar.builder(
                      initialRating: 0,
                      minRating: 1,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      itemCount: 5,
                      itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                      itemBuilder: (context, _) => Icon(
                        Icons.star,
                        color: kSecondPrimaryColor,
                      ),
                      onRatingUpdate: (rating) {
                        userAdedRate = rating;
                      },
                    ),SizedBox(height:20),
                    Button(
                        text: "إضافة مراجعة",
                        pressed: () {
                          if (_formKey.currentState.validate() &&
                              userAdedRate != 0) {
                            print('the rate is $userAdedRate');
                          } else {
                            print("Error $userAdedRate");
                          }
                        })
                  ],
                ))
          ],
        ),
      ),
    );
  }
}

class RatingBarW extends StatelessWidget {
  const RatingBarW({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RatingBarIndicator(
      rating: 4,
      itemBuilder: (context, index) => Icon(
        Icons.star,
        color: kSecondPrimaryColor,
      ),
      itemCount: 5,
      itemSize: 50.0,
      unratedColor: Colors.amber.withAlpha(50),
      direction: true ? Axis.horizontal : Axis.horizontal,
    );
  }
}

class LabelWidget extends StatelessWidget {
  const LabelWidget({Key key, this.text, this.color: kSecondPrimaryColor})
      : super(key: key);
  final String text;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: double.infinity / 2,
        child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25.0),
            ),
            color: color.withOpacity(.8),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: SubText(
                text: text,
                color: Colors.white,
              ),
            )));
  }
}

class BookReviews1 extends StatelessWidget {
  const BookReviews1({
    @required this.bookReviews,
    Key key,
  }) : super(key: key);

  final BookReviews bookReviews;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          BookInfoUserInfo(
            bookReviews: bookReviews,
          ),
          SizedBox(height: 10),
          Text(
            bookReviews.review,
            style: textStyle,
          ),
          SizedBox(height: 10),
        ],
      ),
    );
  }
}

class BookInfoUserInfo extends StatelessWidget {
  const BookInfoUserInfo({
    Key key,
    @required this.bookReviews,
  }) : super(key: key);
  final BookReviews bookReviews;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            CircleAvatar(
              radius: 20,
              backgroundImage: NetworkImage(
                  'https://cdn02.plentymarkets.com/4n91gk7bomyj/item/images/124582293/full/--------------------------------------------------------------------------01.jpg'),
            ),
            SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(bookReviews.name, style: TextStyle(fontSize: 14)),
                Text(
                  bookReviews.userName,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.black.withOpacity(.5),
                  ),
                ),
              ],
            ),
          ],
        )
      ],
    );
  }
}

class BookInfoSummary extends StatelessWidget {
  const BookInfoSummary({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          SubText(
            text: " ملخص الكتاب",
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text(
                "Now consider a second example, this time with an aspect ratio of 2.0 and layout constraints that require the width",
                textAlign: TextAlign.center,
                style: textStyle.copyWith(  fontWeight: FontWeight.normal,
                )),
          ),
        ],
      ),
    );
  }
}

class BookInfoTag extends StatelessWidget {
  const BookInfoTag({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Button(text: "علم ", pressed: () {}, height: 30, peiece: 3.4),
        Button(text: "ثقافة", pressed: () {}, height: 30, peiece: 3.4),
        Button(text: "فكر", pressed: () {}, height: 30, peiece: 3.4),
      ],
    );
  }
}

class BookImage extends StatelessWidget {
  const BookImage({
    Key key,
    @required this.imageUrl,
  }) : super(key: key);

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      width: double.infinity,
      child:
          Card(
            child: Stack(
              children: [
                Center(
                  child: Image.network(
                      "https://cdn02.plentymarkets.com/4n91gk7bomyj/item/images/124582293/full/--------------------------------------------------------------------------01.jpg"),
                ),
                LabelW(text:"P12")
              ],
            )
          ),


    );
  }
}

class LabelW extends StatelessWidget {
  const LabelW({
    Key key,@required this.text, this.width:60, this.height:35,
  }) : super(key: key);

  final String text ;
  final double width ;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
        width: width,
        child: Text(

            text,
            textAlign: TextAlign.center,style:textStyle.copyWith(color: Colors.white)),
                   padding: const EdgeInsets.fromLTRB(14.0,7,14,7),

    decoration:BoxDecoration(
        color:kPrimaryColor,
        borderRadius: BorderRadius.circular(5),
      boxShadow: [
        BoxShadow(color: Colors.white, spreadRadius: 1),
      ],
    ));
  }
}

class bookDetails extends StatelessWidget {
  const bookDetails({
    Key key,
    this.label,
    this.info,
  }) : super(key: key);
  final String label;
  final String info;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8,4,8,4),
      child: Align(
        alignment: Alignment.topRight,
        child: SizedBox(
          child: Row(
            children: [


              Text("$label : "),
              SizedBox(
                width: 10,
              ),
              SubText(
                text: "$info",
                textSize: 17,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class BookDetailsW extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          BookImage(),
          SizedBox(height: 10),
          SubText(text: "السيرة الذاتية للمسيري", textSize: 24),
          SizedBox(height: 15),
          Directionality(
            textDirection: TextDirection.rtl,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                bookDetails(label: "التصنيف ", info: " أدب"),
                GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AuthorInformation()),
                      );
                    },
                    child: bookDetails(
                        label: "الكاتب ", info: " عبد الوهاب المسيري")),
                bookDetails(label: "عدد الصفحات ", info: "200"),
              ],
            ),
          ),
          SizedBox(height: 15),
          RatingBarW(),
          SizedBox(height: 15),
          BookInfoTag(),
          SizedBox(height: 15),
          BookInfoSummary(),
          SizedBox(height: 15),
          Text('الكتاب متاح للإستعارة',style: textStyle.copyWith(color:kPrimaryColor,fontSize: 20),)
        ],
      ),
    );
  }
}
