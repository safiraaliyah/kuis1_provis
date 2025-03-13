import 'package:flutter/material.dart';

class PaketPromosiScreen extends StatelessWidget {
  const PaketPromosiScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isDesktop = MediaQuery.of(context).size.width >= 800;

    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: isDesktop
          ? null
          : PreferredSize(
              preferredSize: const Size.fromHeight(60),
              child: AppBar(
                backgroundColor: Colors.white,
                elevation: 0,
                title: Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.menu, color: Colors.black),
                      onPressed: () {},
                    ),
                    Expanded(
                      child: Container(
                        height: 40,
                        decoration: BoxDecoration(
                          color: const Color(0xFFEFEFEF),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          children: [
                            const SizedBox(width: 10),
                            const Expanded(
                              child: TextField(
                                decoration: InputDecoration(
                                  hintText: 'Search here...',
                                  border: InputBorder.none,
                                  hintStyle: TextStyle(color: Colors.grey),
                                ),
                              ),
                            ),
                            Container(
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                color: const Color(0xFF5D7B6A),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: const Icon(Icons.search, color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Icon(Icons.person_outline, color: Colors.black),
                    ),
                  ],
                ),
              ),
            ),
      body: isDesktop ? _buildDesktopLayout() : _buildMobileLayout(),
      bottomNavigationBar: isDesktop ? null : _buildMobileNavBar(),
      floatingActionButton: isDesktop
          ? null
          : Padding(
              padding: const EdgeInsets.only(bottom: 60.0),
              child: FloatingActionButton(
                onPressed: () {},
                backgroundColor: const Color(0xFF5D7B6A),
                child: const Icon(Icons.headset_mic),
              ),
            ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }

  Widget _buildMobileLayout() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Package Title
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Package',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          // Package Grid
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.85, // Adjusted for better image visibility
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
              ),
              itemCount: packageItems.length,
              itemBuilder: (context, index) {
                return _buildPackageItem(
                  name: packageItems[index].name,
                  price: packageItems[index].price,
                  rating: packageItems[index].rating,
                  reviews: packageItems[index].reviews,
                  imageUrl: packageItems[index].imageUrl,
                  isAsset: packageItems[index].isAsset,
                );
              },
            ),
          ),
          const SizedBox(height: 70), // Space for bottom navigation
        ],
      ),
    );
  }

  Widget _buildDesktopLayout() {
    return Row(
      children: [
        // Sidebar
        _buildDesktopSidebar(),
        // Main Content
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Package Title
                const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    'Package',
                    style: TextStyle(
                      fontSize: 24, // Increased font size for desktop
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                // Package Grid
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4, // Adjusted for desktop
                      childAspectRatio: 0.85, // Adjusted for better image visibility
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                    ),
                    itemCount: packageItems.length,
                    itemBuilder: (context, index) {
                      return _buildPackageItem(
                        name: packageItems[index].name,
                        price: packageItems[index].price,
                        rating: packageItems[index].rating,
                        reviews: packageItems[index].reviews,
                        imageUrl: packageItems[index].imageUrl,
                        isAsset: packageItems[index].isAsset,
                      );
                    },
                  ),
                ),
                const SizedBox(height: 32), // Bottom padding
              ],
            ),
          ),
        ),
      ],
    );
  }

 Widget _buildDesktopSidebar() {
  return Container(
    width: 240,
    color: Colors.white,
    padding: const EdgeInsets.symmetric(vertical: 20),
    child: Column(
      children: [
        const CircleAvatar(
          backgroundColor: Color(0xFF5D7B6A),
          radius: 24,
          child: Text(
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
          'NASAP CAMP',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        const SizedBox(height: 48),
        _buildDesktopNavItem(Icons.home, 'Home', false),
        _buildDesktopNavItem(Icons.chat, 'Chat', false),
        _buildDesktopNavItem(Icons.favorite, 'Wishlist', false),
        _buildDesktopNavItem(Icons.star, 'Review & Rating', false),
        _buildBoldGreenNavItem(Icons.card_giftcard, 'Pembelian Paket'),
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
      onTap: () {}, // Add onTap handler
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFF5D7B6A) : Colors.transparent,
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

Widget _buildBoldGreenNavItem(IconData icon, String label) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 20.0),
    child: InkWell(
      onTap: () {}, // Add onTap handler
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 14.0, horizontal: 18.0),
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Icon(
              icon,
              color: const Color(0xFF005500),
              size: 24,
            ),
            const SizedBox(width: 16),
            Text(
              label,
              style: const TextStyle(
                color: Color(0xFF005500),
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

  Widget _buildMobileNavBar() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, -1),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildNavItem(Icons.receipt, false),
            _buildNavItem(Icons.shopping_cart, false),
            _buildHomeNavItem(),
            _buildNavItem(Icons.chat_bubble_outline, false),
            _buildNavItem(Icons.favorite_border, false),
          ],
        ),
      ),
    );
  }

  Widget _buildPackageItem({
    required String name,
    required double price,
    required double rating,
    required int reviews,
    required String imageUrl,
    bool isAsset = false,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Product Image
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(15),
              topRight: Radius.circular(15),
            ),
            child: isAsset 
              ? Image.asset(
                  imageUrl,
                  height: 150, // Increased height for better visibility
                  width: double.infinity,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    // Fallback image if asset fails to load
                    return Container(
                      height: 150,
                      width: double.infinity,
                      color: const Color(0xFFEEEEEE),
                      child: const Icon(Icons.image_not_supported, size: 50, color: Colors.grey),
                    );
                  },
                )
              : Image.network(
                  imageUrl,
                  height: 150, // Increased height for better visibility
                  width: double.infinity,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    // Fallback image if network image fails to load
                    return Container(
                      height: 150,
                      width: double.infinity,
                      color: const Color(0xFFEEEEEE),
                      child: const Icon(Icons.image_not_supported, size: 50, color: Colors.grey),
                    );
                  },
                ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0), // Increased padding for better spacing
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 6),
                Text(
                  'Rp ${price.toStringAsFixed(0)}',
                  style: const TextStyle(
                    color: Color(0xFF5D7B6A),
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 6),
                Row(
                  children: [
                    const Icon(
                      Icons.star,
                      color: Colors.amber,
                      size: 16,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      rating.toString(),
                      style: const TextStyle(fontSize: 12),
                    ),
                    const SizedBox(width: 4),
                    Text(
                      '($reviews)',
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem(IconData icon, bool isSelected) {
    return IconButton(
      icon: Icon(
        icon,
        color: isSelected ? const Color(0xFF5D7B6A) : Colors.grey,
        size: 24, // Increased size for better visibility
      ),
      onPressed: () {},
    );
  }

  Widget _buildHomeNavItem() {
    return Container(
      width: 50,
      height: 50,
      decoration: const BoxDecoration(
        color: Color(0xFF5D7B6A),
        shape: BoxShape.circle,
      ),
      child: IconButton(
        icon: const Icon(
          Icons.home,
          color: Colors.white,
          size: 24,
        ),
        onPressed: () {},
      ),
    );
  }
}
class PackageItem {
  final String name;
  final double price;
  final double rating;
  final int reviews;
  final String imageUrl;
  final bool isAsset;

  PackageItem({
    required this.name,
    required this.price,
    required this.rating,
    required this.reviews,
    required this.imageUrl,
    this.isAsset = false,
  });
}

final List<PackageItem> packageItems = [
  PackageItem(
    name: 'Paket Camping Basic',
    price: 450000,
    rating: 4.8,
    reviews: 124,
    imageUrl: 'assets/image/tenda1.png',
    isAsset: true,
  ),
  PackageItem(
    name: 'Paket Adventure Pro',
    price: 750000,
    rating: 4.9,
    reviews: 89,
    imageUrl: 'assets/image/tenda2.png',
    isAsset: true,
  ),
  PackageItem(
    name: 'Paket Survival',
    price: 650000,
    rating: 4.7,
    reviews: 76,
    imageUrl: 'assets/image/tenda3.png',
    isAsset: true,
  ),
  PackageItem(
    name: 'Paket Family Outdoor',
    price: 950000,
    rating: 4.8,
    reviews: 112,
    imageUrl: 'assets/image/tenda1.png',
    isAsset: true,
  ),
  PackageItem(
    name: 'Paket Family Outdoor',
    price: 950000,
    rating: 4.8,
    reviews: 112,
    imageUrl: 'assets/image/tenda2.png',
    isAsset: true,
  ),
  PackageItem(
    name: 'Paket Family Outdoor',
    price: 950000,
    rating: 4.8,
    reviews: 112,
    imageUrl: 'assets/image/tenda3.png',
    isAsset: true,
  ),
  PackageItem(
    name: 'Paket Family Outdoor',
    price: 950000,
    rating: 4.8,
    reviews: 112,
    imageUrl: 'assets/image/tenda1.png',
    isAsset: true,
  ),
  PackageItem(
    name: 'Paket Family Outdoor',
    price: 950000,
    rating: 4.8,
    reviews: 112,
    imageUrl: 'assets/image/tenda2.png',
    isAsset: true,
  ),
  PackageItem(
    name: 'Paket Family Outdoor',
    price: 950000,
    rating: 4.8,
    reviews: 112,
    imageUrl: 'assets/image/tenda3.png',
    isAsset: true,
  ),
];