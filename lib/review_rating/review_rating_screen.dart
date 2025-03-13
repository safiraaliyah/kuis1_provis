import 'package:flutter/material.dart';

class Review {
  final String name;
  final String date;
  final String comment;
  final double rating;
  final String avatarText;

  Review({
    required this.name,
    required this.date,
    required this.comment,
    required this.rating,
    required this.avatarText,
  });
}

class ReviewRatingScreen extends StatelessWidget {
  const ReviewRatingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isMobile = MediaQuery.of(context).size.width < 800;

    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: isMobile
          ? AppBar(
              backgroundColor: Colors.white,
              elevation: 0,
              centerTitle: true,
              title: const Text(
                'Product Reviews',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              leading: IconButton(
                icon: const Icon(Icons.arrow_back, color: Colors.black),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              bottom: PreferredSize(
                preferredSize: const Size.fromHeight(1),
                child: Container(
                  height: 1,
                  color: Colors.grey.shade300,
                ),
              ),
            )
          : null,
      body: isMobile ? _buildMobileLayout() : _buildDesktopLayout(),
      bottomNavigationBar: isMobile ? _buildMobileNavBar() : null,
    );
  }

  Widget _buildMobileLayout() {
    final List<Review> reviews = [
      Review(
        name: 'Ahmad Rizki',
        date: 'March 10, 2025',
        comment:
            'The tent is very good quality and waterproof. We used it during heavy rain and stayed completely dry. The setup was also very easy.',
        rating: 5.0,
        avatarText: 'A',
      ),
      Review(
        name: 'Budi Santoso',
        date: 'March 8, 2025',
        comment:
            'I love the spacious interior and how lightweight it is. Perfect for backpacking trips. The only downside is that it gets a bit warm during summer.',
        rating: 4.0,
        avatarText: 'B',
      ),
      Review(
        name: 'Citra Dewi',
        date: 'March 5, 2025',
        comment:
            'Great value for money. The tent is sturdy and has withstood strong winds on our camping trip. The color is exactly as shown in the pictures.',
        rating: 5.0,
        avatarText: 'C',
      ),
      Review(
        name: 'Dimas Pratama',
        date: 'February 28, 2025',
        comment:
            'Second time buying this brand. The quality is consistent and the customer service is excellent. Highly recommended for family camping.',
        rating: 5.0,
        avatarText: 'D',
      ),
    ];

    return SingleChildScrollView(
      child: Column(
        children: [
          _buildRatingSummary(),
          ...reviews.map((review) => _buildReviewItem(review)).toList(),
        ],
      ),
    );
  }

  Widget _buildDesktopLayout() {
    final List<Review> reviews = [
      Review(
        name: 'Ahmad Rizki',
        date: 'March 10, 2025',
        comment:
            'The tent is very good quality and waterproof. We used it during heavy rain and stayed completely dry. The setup was also very easy.',
        rating: 5.0,
        avatarText: 'A',
      ),
      Review(
        name: 'Budi Santoso',
        date: 'March 8, 2025',
        comment:
            'I love the spacious interior and how lightweight it is. Perfect for backpacking trips. The only downside is that it gets a bit warm during summer.',
        rating: 4.0,
        avatarText: 'B',
      ),
      Review(
        name: 'Citra Dewi',
        date: 'March 5, 2025',
        comment:
            'Great value for money. The tent is sturdy and has withstood strong winds on our camping trip. The color is exactly as shown in the pictures.',
        rating: 5.0,
        avatarText: 'C',
      ),
      Review(
        name: 'Dimas Pratama',
        date: 'February 28, 2025',
        comment:
            'Second time buying this brand. The quality is consistent and the customer service is excellent. Highly recommended for family camping.',
        rating: 5.0,
        avatarText: 'D',
      ),
    ];

    return Row(
      children: [
        _buildDesktopSideNavigation(),
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                _buildRatingSummary(),
                ...reviews.map((review) => _buildReviewItem(review)).toList(),
              ],
            ),
          ),
        ),
      ],
    );
  }
Widget _buildDesktopSideNavigation() {
  return Container(
    width: 240,
    color: Colors.white,
    padding: const EdgeInsets.symmetric(vertical: 20),
    child: Column(
      children: [
        CircleAvatar(
          backgroundColor: const Color(0xFF5E7562),
          radius: 24,
          child: const Text(
            'GO',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
        ),
        const SizedBox(height: 16),
        const Text(
          'NASAP CAMPS',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        const SizedBox(height: 48),
        _buildDesktopNavItem(Icons.home, 'Home', false), // Home tidak bold
        _buildDesktopNavItem(Icons.chat, 'Chat', false),
        _buildDesktopNavItem(Icons.favorite, 'Wishlist', false),
        // Tambahkan item "Review & Rating" di sini
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
          child: InkWell(
            borderRadius: BorderRadius.circular(12),
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
              decoration: BoxDecoration(
                color: const Color(0xFF5E7562), // Warna latar belakang hijau tua
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.star,
                    color: Colors.white, // Warna ikon putih
                    size: 24,
                  ),
                  const SizedBox(width: 16),
                  Text(
                    'Review & Rating',
                    style: TextStyle(
                      color: Colors.white, // Warna teks putih
                      fontSize: 16,
                      fontWeight: FontWeight.bold, // Teks bold
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        const Spacer(),
        _buildDesktopNavItem(Icons.shopping_basket, 'Keranjang', false),
        const SizedBox(height: 24),
      ],
    ),
  );
}

  Widget _buildDesktopNavItem(IconData icon, String label, bool isSelected) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
          decoration: BoxDecoration(
            color: isSelected ? const Color(0xFF5E7562) : Colors.transparent,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              Icon(
                icon,
                color: isSelected ? Colors.white : Colors.grey,
                size: 24,
              ),
              const SizedBox(width: 16),
              Text(
                label,
                style: TextStyle(
                  color: isSelected ? Colors.white : Colors.grey,
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMobileNavBar() {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.chat),
          label: 'Chat',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite),
          label: 'Wishlist',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.shopping_basket),
          label: 'Keranjang',
        ),
      ],
      currentIndex: 0,
      selectedItemColor: const Color(0xFF5E7562),
      unselectedItemColor: Colors.grey,
      showUnselectedLabels: true,
    );
  }

  Widget _buildRatingSummary() {
    return Container(
      padding: const EdgeInsets.all(16.0),
      color: Colors.white,
      margin: const EdgeInsets.only(top: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Rating Summary',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              // Left side - average rating
              Expanded(
                flex: 2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      '4.8',
                      style: TextStyle(
                        fontSize: 48,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF5E7562),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(5, (index) {
                        return const Icon(
                          Icons.star,
                          color: Colors.amber,
                          size: 16,
                        );
                      }),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Based on 124 reviews',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey.shade600,
                      ),
                    ),
                  ],
                ),
              ),
              // Right side - rating bars
              Expanded(
                flex: 3,
                child: Column(
                  children: [
                    _buildRatingBar(5, 0.75, '75%'),
                    const SizedBox(height: 8),
                    _buildRatingBar(4, 0.15, '15%'),
                    const SizedBox(height: 8),
                    _buildRatingBar(3, 0.05, '5%'),
                    const SizedBox(height: 8),
                    _buildRatingBar(2, 0.03, '3%'),
                    const SizedBox(height: 8),
                    _buildRatingBar(1, 0.02, '2%'),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildRatingBar(int stars, double percentage, String label) {
    return Row(
      children: [
        Text(
          '$stars',
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(width: 4),
        const Icon(Icons.star, color: Colors.amber, size: 12),
        const SizedBox(width: 8),
        Expanded(
          child: Stack(
            children: [
              Container(
                height: 8,
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
              FractionallySizedBox(
                widthFactor: percentage,
                child: Container(
                  height: 8,
                  decoration: BoxDecoration(
                    color: const Color(0xFF5E7562),
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(width: 8),
        SizedBox(
          width: 32,
          child: Text(
            label,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildReviewItem(Review review) {
    final backgroundColor = const Color(0xFFF3EFC5);

    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Reviewer info and rating
          Row(
            children: [
              CircleAvatar(
                backgroundColor: const Color(0xFFEEEEEE),
                child: Text(
                  review.avatarText,
                  style: const TextStyle(
                    color: Color(0xFF5E7562),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      review.name,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                    Text(
                      review.date,
                      style: TextStyle(
                        color: Colors.grey.shade600,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                children: List.generate(5, (i) {
                  return Icon(
                    i < review.rating ? Icons.star : Icons.star_border,
                    color: Colors.amber,
                    size: 16,
                  );
                }),
              ),
            ],
          ),

          // Review comment
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: Text(
              review.comment,
              style: const TextStyle(
                fontSize: 14,
                height: 1.5,
              ),
            ),
          ),

          // Review images
          SizedBox(
            height: 80,
            child: Row(
              children: List.generate(
                3,
                (index) => Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Container(
                      width: 80,
                      height: 80,
                      color: backgroundColor.withOpacity(0.5),
                      child: const Center(
                        child: Icon(
                          Icons.image,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}