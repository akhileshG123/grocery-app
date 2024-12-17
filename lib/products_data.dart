class Product {
  final String name;
  final double price;
  final double originalPrice;
  final int discount;
  final String imageUrl;
  final bool inCart;
  final String description;

  Product({
    required this.name,
    required this.price,
    required this.originalPrice,
    required this.discount,
    required this.imageUrl,
    required this.inCart,
    required this.description,
  });
}

List<Product> products = [
  Product(
      name: 'Britannia Eggless Cake',
      price: 2.99,
      originalPrice: 4.99,
      discount: 40,
      imageUrl: 'assets/images/cake.png',
      inCart: false,
      description: 'a sweet baked food made from a dough or thick batter usually containing flour and sugar and often shortening, and a raising agent'
      ),
      
  Product(
      name: 'Thums Up/ Fanta / Limca',
      price: 4.49,
      originalPrice: 4.99,
      discount: 10,
      imageUrl: 'assets/images/drinks.png',
      inCart: true,
      description: ' Nonalcoholic beverages typically containing water, sweeteners, and some flavorings. Sometime, they are also called pops, soda, or fizzy drinks.'
      ),

  Product(
      name: 'Harroz Basmati Rice 8lb',
      price: 9.99,
      originalPrice: 14.99,
      discount: 33,
      imageUrl: 'assets/images/rice.png',
      inCart: false,
      description: 'When cooked properly, basmati rice is light, tender and fluffy – not sticky like other types of rice. This, combined with its fragrant taste, makes it a versatile rice to serve as a simple side that will go with virtually anything or as a bed to your favorite saucy dishes and stews.',
      ),
  Product(
      name: 'Nature Gift Basmati Rice',
      price: 9.99,
      originalPrice: 13.99,
      discount: 29,
      imageUrl: 'assets/images/rice2.png',
      inCart: false,
      description: ' Known for its extra-long, slender grains that elongate to at least twice their original size when cooked, Basmati rice offers a distinctive soft and fluffy texture, delicious taste, superior aroma, and a distinct flavor that sets it apart from other aromatic long-grain rice varieties.',
      
      ),
  Product(
      name: 'Red Onion Bag 10lb',
      price: 9.99,
      originalPrice: 13.99,
      discount: 32,
      imageUrl: 'assets/images/onion.png',
      inCart: false,
      description: ' They are most commonly used in cooking, but the skin has also been used as a dye.',
      ),
  Product(
      name: 'Bread',
      price: 4.99,
      originalPrice: 6.99,
      discount: 29,
      imageUrl: 'assets/images/bread.png',
      inCart: true,
      description: 'Oven milk bread,rich in calcium and vitamin.',
      )
];
