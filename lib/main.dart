import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FirstPage(),
    );
  }
}

class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(68, 255, 236, 179),
      appBar: AppBar(
        title: Text('Book List',
        style: TextStyle(fontSize: 24)),
        centerTitle: true,
        backgroundColor: Color.fromARGB(235, 102, 255, 0),
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          CardWidget('Lord Of The Rings', ' J.R.R Tolkien', '4.7','book1.jpg',
              'The future of civilization rests in the fate of the One Ring, which has been lost for centuries. Powerful forces are unrelenting in their search for it. But fate has placed it in the hands of a young Hobbit named Frodo Baggins (Elijah Wood), who inherits the Ring and steps into legend. A daunting task lies ahead for Frodo when he becomes the Ringbearer - to destroy the One Ring in the fires of Mount Doom where it was forged.',12.5),
          CardWidget('Harry Potter and The Cursed Child', 'J.K Rowling', '4.8',
              'book2.png','Without the guidance and protection of their professors, Harry (Daniel Radcliffe), Ron (Rupert Grint) and Hermione (Emma Watson) begin a mission to destroy the Horcruxes, the sources of Voldemort''s immortality. Though they must rely on one another more than ever, dark forces threaten to tear them apart.',14),
          CardWidget('Jujutsu Kaisen', 'Gege Akutami', '4.7',
              'book3.jpg','The story follows high school student Yuji Itadori as he joins a secret organization of Jujutsu Sorcerers in order to kill a powerful Curse named Ryomen Sukuna, of whom Yuji becomes the host.',15)

        ],
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  final String bookName;
  final String authorName;
  final String imageName;
  final String description;
  final double price;

  SecondPage(this.bookName,this.authorName,this.imageName,this.description,this.price);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(80, 255, 236, 179),   appBar: AppBar(
        title: Text('Buy Now'),
        backgroundColor: const Color.fromARGB(255, 21, 255, 0),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Book Name: $bookName\n',
            style: TextStyle(fontSize: 20),),
            Image.asset('assets/$imageName'), 
            Text('\nAuthor Name: $authorName'), 
            Text('\nShort Description: $description'),
            Text('\nPrice: \$$price',
              style: TextStyle(fontSize: 18),), 
            DropdownButton<String>(
              items: ['Real copy', 'Paper print', 'Black & white'].map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String? newValue) {
                
              },
              hint: Text('Select an option'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Go Back', style : TextStyle(color: Colors.amberAccent)),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Color.fromARGB(255, 57, 128, 36)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CardWidget extends StatelessWidget {
  final String bookName;
  final String authorName;
  final String bookRating;
  final String imageName;
  final String description;
  final double price;

  CardWidget(this.bookName, this.authorName, this.bookRating,this.imageName,this.description,this.price);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.amber[70],
      child: Column(
        children: [
          ListTile(
            leading: Image.asset('assets/$imageName'), 
            title: Text(bookName,
                style: TextStyle(fontSize: 25)),
            subtitle: Text(authorName),
          ),
          ListTile(
            title: Text('Rating: $bookRating',
                style: TextStyle(fontSize: 20)),
          ),
          ElevatedButton.icon(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SecondPage(bookName,authorName,imageName,description,price)),
              );
            },
            icon: Icon(Icons.shopping_basket),
            label: Text('Buy Now', style : TextStyle(color: Colors.amberAccent)),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Color.fromARGB(255, 58, 141, 90)),
            ),
          ),
        ],
      ),
    );
  }
}



