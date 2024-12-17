import 'package:flutter/material.dart';
import 'products_data.dart';

class ProductsList extends StatelessWidget {
  const ProductsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('All Products'),
        centerTitle: true,
        backgroundColor: Colors.green,
        actions: [
          IconButton(
            icon: const Icon(Icons.filter_list),
            onPressed: () {
              // Logic for filter action can be added here
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          itemCount: products.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.5,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemBuilder: (context, index) {
            return ProductCard(product: products[index]);
          },
        ),
      ),
    );
  }
}

class ProductCard extends StatefulWidget {
  final Product product;

  const ProductCard({super.key, required this.product});

  @override
  _ProductCardState createState() => _ProductCardState();
}

// State class to manage hover effects on the product card
class _ProductCardState extends State<ProductCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) {
        setState(() {
          _isHovered = true;
        });
      },
      onExit: (_) {
        setState(() {
          _isHovered = false;
        });
      },
      child: GestureDetector(
        onTap: () {
          // Navigate to the product details page when the card is tapped
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ProductDetailsPage(product: widget.product),
            ),
          );
        },
        child: TweenAnimationBuilder(
          duration: const Duration(
              milliseconds: 200), // Animation duration for scaling effect
          tween: Tween<double>(begin: 1.0, end: _isHovered ? 1.05 : 1.0),
          builder: (context, double scale, child) {
            return Transform.scale(
              scale: scale, // Apply the scale transformation
              child: Card(
                elevation: _isHovered ? 8 : 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        children: [
                          // Display product image
                          Image.asset(
                            widget.product.imageUrl,
                            height: 150,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                          // If product has a discount, display it in a badge
                          if (widget.product.discount > 0)
                            Positioned(
                              top: 6,
                              left: 6,
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 6, vertical: 2),
                                color: Colors.green,
                                child: Text(
                                  '${widget.product.discount}% OFF',
                                  style: const TextStyle(
                                      color: Colors.white, fontSize: 12),
                                ),
                              ),
                            ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      // Display product name
                      Text(
                        widget.product.name,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 4),
                      // Display product price
                      Text(
                        '\$${widget.product.price.toStringAsFixed(2)}',
                        style:
                            const TextStyle(color: Colors.green, fontSize: 16),
                      ),

                      if (widget.product.originalPrice > widget.product.price)
                        Text(
                          '\$${widget.product.originalPrice.toStringAsFixed(2)}',
                          style: const TextStyle(
                            color: Colors
                                .grey, // Grey color for crossed-out original price
                            fontSize: 14,
                            decoration: TextDecoration.lineThrough,
                          ),
                        ),
                      const Spacer(),

                      ElevatedButton(
                        onPressed: () {
                          // Add action to handle adding to cart
                        },
                        child: Text(widget.product.inCart ? 'IN CART' : 'ADD'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: widget.product.inCart
                              ? Colors.grey
                              : Colors.green,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class ProductDetailsPage extends StatelessWidget {
  final Product product;

  const ProductDetailsPage(
      {super.key, required this.product}); // Constructor to receive product data

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product.name),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Display product image
            Image.asset(
              product.imageUrl,
              height: 300,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 16),
            // Display product name
            Text(
              product.name,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),
            const SizedBox(height: 8),
            // Display product price
            Text(
              '\$${product.price.toStringAsFixed(2)}', // Display price with 2 decimal places
              style: const TextStyle(color: Colors.green, fontSize: 20),
            ),

            if (product.originalPrice > product.price)
              Text(
                '\$${product.originalPrice.toStringAsFixed(2)}', // Original price
                style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 16,
                  decoration: TextDecoration.lineThrough,
                ),
              ),
            const SizedBox(height: 16),
            // Section title for product details
            const Text(
              'Product Details',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            // Display product description
            Text(
              product.description,
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
