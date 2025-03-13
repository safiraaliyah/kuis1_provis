import 'package:flutter/material.dart';

class DetailItemScreen extends StatefulWidget {
  const DetailItemScreen({Key? key}) : super(key: key);

  @override
  State<DetailItemScreen> createState() => _DetailItemScreenState();
}

class _DetailItemScreenState extends State<DetailItemScreen> {
  int quantity = 1;
  int selectedColorIndex = 0;
  final List<Color> availableColors = [
    const Color(0xFF5E7562), // Green
    const Color(0xFFF8D568), // Yellow
    const Color(0xFF4A69BB), // Blue
    const Color(0xFFE74C3C), // Red
  ];

  @override
  Widget build(BuildContext context) {
    bool isMobile = MediaQuery.of(context).size.width < 800;

    return Scaffold(
      backgroundColor: const Color(0xFFF9F9F7), // Light beige background
      body: isMobile ? _buildMobileLayout() : _buildDesktopLayout(),
    );
  }

  Widget _buildMobileLayout() {
    return SafeArea(
      child: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildImageSection(),
                  _buildProductInfoCard(),
                ],
              ),
            ),
          ),
          _buildBottomActionButtons(),
        ],
      ),
    );
  }

  Widget _buildImageSection() {
    return Stack(
      children: [
        Container(
          height: 320,
          width: double.infinity,
          color: const Color(0xFFF9F9F7),
          child: Center(
            child: Image.asset(
              'assets/image/tenda1.png',
              fit: BoxFit.contain,
            ),
          ),
        ),
        // Back and favorite buttons at the top
        Positioned(
          top: 16,
          left: 16,
          right: 16,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: const Center(
                  child:
                      Icon(Icons.chevron_left, size: 24, color: Colors.black),
                ),
              ),
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: const Center(
                  child: Icon(Icons.favorite_outline,
                      size: 24, color: Colors.black),
                ),
              ),
            ],
          ),
        ),
        // Left and right navigation arrows
        Positioned(
          left: 8,
          top: 0,
          bottom: 0,
          child: Center(
            child: Container(
              width: 36,
              height: 36,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.8),
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: const Center(
                child:
                    Icon(Icons.chevron_left, size: 24, color: Colors.black54),
              ),
            ),
          ),
        ),
        Positioned(
          right: 8,
          top: 0,
          bottom: 0,
          child: Center(
            child: Container(
              width: 36,
              height: 36,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.8),
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: const Center(
                child:
                    Icon(Icons.chevron_right, size: 24, color: Colors.black54),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildProductInfoCard() {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, -5),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildProductNameAndStock(),
            const SizedBox(height: 16),
            _buildPrice(),
            const SizedBox(height: 20),
            _buildColorSelector(),
            const SizedBox(height: 20),
            _buildQuantitySelector(),
            const SizedBox(height: 16),
            _buildRating(),
            const SizedBox(height: 20),
            _buildDescription(),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildProductNameAndStock() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Tenda OZtrail',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 4),
              Text(
                'Ukuran XL',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: const Color(0xFFECF4F0),
            borderRadius: BorderRadius.circular(8),
          ),
          child: const Text(
            'Stok: 3',
            style: TextStyle(
              color: Color(0xFF5E7562),
              fontWeight: FontWeight.w500,
              fontSize: 12,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPrice() {
    return const Row(
      children: [
        Text(
          'Rp 250.000,-',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Color(0xFF5E7562),
          ),
        ),
        SizedBox(width: 8),
        Text(
          'Rp 350.000,-',
          style: TextStyle(
            fontSize: 14,
            decoration: TextDecoration.lineThrough,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }

  Widget _buildColorSelector() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Color',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        Row(
          children: List.generate(
            availableColors.length,
            (index) => GestureDetector(
              onTap: () {
                setState(() {
                  selectedColorIndex = index;
                });
              },
              child: Container(
                margin: const EdgeInsets.only(right: 10),
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                  color: availableColors[index],
                  shape: BoxShape.circle,
                  border: selectedColorIndex == index
                      ? Border.all(color: Colors.black, width: 2)
                      : null,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildBottomActionButtons() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, -5),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.grey.shade200,
                foregroundColor: Colors.black,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                elevation: 0,
              ),
              child: const Text(
                'Add to Cart',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF5E7562),
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                elevation: 0,
              ),
              child: const Text(
                'Buy Now',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Improved quantity selector to match your image
  Widget _buildQuantitySelector() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: const Color(0xFF5E7562), width: 1),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 36,
            height: 36,
            decoration: BoxDecoration(
              color: const Color(0xFF5E7562).withOpacity(0.1),
              borderRadius:
                  const BorderRadius.horizontal(left: Radius.circular(30)),
            ),
            child: IconButton(
              iconSize: 16,
              padding: EdgeInsets.zero,
              icon: const Icon(Icons.remove, color: Color(0xFF5E7562)),
              onPressed: () {
                if (quantity > 1) {
                  setState(() {
                    quantity--;
                  });
                }
              },
            ),
          ),
          SizedBox(
            width: 40,
            child: Center(
              child: Text(
                quantity.toString().padLeft(2, '0'),
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
          ),
          Container(
            width: 36,
            height: 36,
            decoration: BoxDecoration(
              color: const Color(0xFF5E7562),
              borderRadius:
                  const BorderRadius.horizontal(right: Radius.circular(30)),
            ),
            child: IconButton(
              iconSize: 16,
              padding: EdgeInsets.zero,
              icon: const Icon(Icons.add, color: Colors.white),
              onPressed: () {
                setState(() {
                  quantity++;
                });
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRating() {
    return Row(
      children: [
        const Icon(Icons.star, color: Colors.amber, size: 18),
        const SizedBox(width: 4),
        const Text(
          '4.7/5',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),
        ),
        const SizedBox(width: 4),
        Text(
          '(23 reviews)',
          style: TextStyle(
            color: Colors.grey[600],
            fontSize: 12,
          ),
        ),
      ],
    );
  }

  Widget _buildDescription() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Description',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Text(
                'Review Detail',
                style: TextStyle(
                  fontSize: 12,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        const Text(
          'Kami menyediakan berbagai jenis tenda untuk keperluan pribadi, bisnis, maupun acara besar. Dengan bahan berkualitas tinggi dan desain kokoh, tenda kami tahan terhadap berbagai kondisi cuaca.',
          style: TextStyle(
            fontSize: 12,
            color: Colors.black87,
            height: 1.5,
          ),
        ),
      ],
    );
  }

  Widget _buildDesktopLayout() {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () => Navigator.pop(context),
            ),
            _buildImageGallerySection(),
            _buildProductDetailsSection(),
          ],
        ),
      ),
    );
  }

  Widget _buildImageGallerySection() {
    return Expanded(
      flex: 5,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 4,
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xFFF5F5F5),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Stack(
                  children: [
                    Center(
                      child: Image.asset(
                        'assets/image/tenda1.png',
                        fit: BoxFit.contain,
                      ),
                    ),
                    Positioned(
                      top: 16,
                      right: 16,
                      child: IconButton(
                        icon: const Icon(Icons.favorite_outline,
                            color: Colors.black),
                        onPressed: () {},
                        style: IconButton.styleFrom(
                          backgroundColor: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: 100,
              child: Row(
                children: List.generate(
                  4,
                  (index) => Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          border: index == 0
                              ? Border.all(
                                  color: const Color(0xFF5E7562), width: 2)
                              : null,
                          color: const Color(0xFFF5F5F5),
                        ),
                        child: Center(
                          child: Image.asset(
                            'assets/image/tenda1.png',
                            fit: BoxFit.contain,
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
      ),
    );
  }

  Widget _buildProductDetailsSection() {
    return Expanded(
      flex: 4,
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Tenda OZtrail',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Ukuran XL',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  const Icon(Icons.star, color: Colors.amber),
                  const SizedBox(width: 8),
                  const Text(
                    '4.7/5',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    '(23 reviews)',
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              Row(
                children: [
                  const Text(
                    'Rp 250.000,-',
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF5E7562)),
                  ),
                  const SizedBox(width: 16),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                    decoration: BoxDecoration(
                      color: const Color(0xFFECF4F0),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Text(
                      'Stok: 3',
                      style: TextStyle(
                        color: Color(0xFF5E7562),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              const Text(
                'Color',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Row(
                children: List.generate(
                  availableColors.length,
                  (index) => GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedColorIndex = index;
                      });
                    },
                    child: Container(
                      margin: const EdgeInsets.only(right: 10),
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: availableColors[index],
                        shape: BoxShape.circle,
                        border: selectedColorIndex == index
                            ? Border.all(color: Colors.black, width: 2)
                            : null,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              const Text(
                'Quantity',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Container(
                decoration: BoxDecoration(
                  color: const Color(0xFFF5F5F5),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.remove, color: Colors.black54),
                      onPressed: () {
                        if (quantity > 1) {
                          setState(() {
                            quantity--;
                          });
                        }
                      },
                    ),
                    Text(
                      quantity.toString().padLeft(2, '0'),
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.add, color: Colors.black54),
                      onPressed: () {
                        setState(() {
                          quantity++;
                        });
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              const Text(
                'Description',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Kami menyediakan berbagai jenis tenda untuk keperluan pribadi, bisnis, maupun acara besar. Dengan bahan berkualitas tinggi dan desain kokoh, tenda kami tahan terhadap berbagai kondisi cuaca, memberikan kenyamanan dan perlindungan maksimal.',
                style: TextStyle(
                  color: Colors.black87,
                  height: 1.5,
                ),
              ),
              const Spacer(),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: Colors.black,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                          side: BorderSide(color: Colors.grey[300]!),
                        ),
                      ),
                      child: const Text('Add to Cart'),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF5E7562),
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: const Text('Buy Now'),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}