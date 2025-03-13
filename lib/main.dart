import 'package:flutter/material.dart';
import 'package:kuis1_provis/chart/chart_screen.dart';
import 'package:kuis1_provis/detail_item/detail_item_screen.dart' show DetailItemScreen;
import 'package:kuis1_provis/home/home_screen.dart';
import 'package:kuis1_provis/chat/chat_screen.dart';
import 'package:kuis1_provis/wishlist/wishlist_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quiz 1 UI',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
        fontFamily: 'Arial',
      ),
      home: const QuizScreen(),
    );
  }
}

class QuizScreen extends StatelessWidget {
  const QuizScreen({super.key});

  // Define consistent colors across mobile and desktop
  static const Color darkGreenColor = Color(0xFF4CAF50); // Warna hijau lebih muda
  static const Color lightGreenColor = Color(0xFF81C784); // Warna hijau lebih cerah

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MediaQuery.of(context).size.width > 600
          ? AppBar(
              title: const Text('RENTAL ALAT KEMAH'),
              backgroundColor: darkGreenColor,
            )
          : null,
      body: LayoutBuilder(
        builder: (context, constraints) {
          // Check if we're on desktop or mobile
          final isDesktop = constraints.maxWidth > 600;

          if (isDesktop) {
            return _buildDesktopLayout(context);
          } else {
            return _buildMobileLayout(context);
          }
        },
      ),
    );
  }

  Widget _buildDesktopLayout(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                const Text(
                  'Quiz 1 : UI',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'No. Kelompok Praktikum : 54',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black.withOpacity(0.7),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Nashwa Nadria Futi 2308130',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black.withOpacity(0.7),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Safira Aliyah Azmi 2309209',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black.withOpacity(0.7),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: GridView.count(
                crossAxisCount: 4,
                mainAxisSpacing: 16.0,
                crossAxisSpacing: 16.0,
                children: [
                  _buildClickableGridItem(
                    context: context,
                    icon: Icons.home,
                    label: 'Halaman Depan',
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const HomeScreen(),
                        ),
                      );
                    },
                  ),
                  _buildClickableGridItem(
                    context: context,
                    icon: Icons.list_alt,
                    label: 'Rincian Item',
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const DetailItemScreen(),
                        ),
                      );
                    },
                  ),
                  _buildClickableGridItem(
                    context: context,
                    icon: Icons.chat,
                    label: 'Chat',
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const ChatScreen(),
                        ),
                      );
                    },
                  ),
                  _buildClickableGridItem(
                    context: context,
                    icon: Icons.favorite,
                    label: 'Wishlist',
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const WishlistScreen(),
                        ),
                      );
                    },
                  ),
                  _buildClickableGridItem(
                    context: context,
                    icon: Icons.shopping_cart,
                    label: 'Keranjang dan Checkout',
                    onTap: () {
                       Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const ChartScreen(),
                        ),
                      );
                    },
                  ),
                  _buildClickableGridItem(
                    context: context,
                    icon: Icons.shopping_bag,
                    label: 'Pembelian Paket',
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Pembelian Paket clicked')),
                      );
                    },
                  ),
                  _buildClickableGridItem(
                    context: context,
                    icon: Icons.reviews,
                    label: 'Review & Rating',
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Review & Rating clicked')),
                      );
                    },
                  ),
                  _buildClickableGridItem(
                    context: context,
                    icon: Icons.monitor,
                    label: 'Monitor Pesanan',
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Monitor Pesanan clicked')),
                      );
                    },
                  ),
                  _buildClickableGridItem(
                    context: context,
                    icon: Icons.add_box,
                    label: 'Pengembalian',
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Pengembalian clicked')),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildClickableGridItem({
    required BuildContext context,
    required IconData icon, 
    required String label,
    required VoidCallback onTap,
    bool isHeader = false,
    bool useHeaderColor = false,
  }) {
    return HoverableGridItem(
      icon: icon,
      label: label,
      isHeader: isHeader,
      useHeaderColor: useHeaderColor,
      onTap: onTap,
    );
  }

  Widget _buildMobileLayout(BuildContext context) {
    return Column(
      children: [
        Container(
          color: Colors.white,
          padding: const EdgeInsets.all(16.0),
          child: SafeArea(
            child: Column(
              children: [
                const SizedBox(height: 8),
                const Text(
                  'Quiz 1 : UI',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'No. Kelompok Praktikum : 54',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.black.withOpacity(0.7),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Nashwa Nadria Futi 2308130',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.black.withOpacity(0.7),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Safira Aliyah Azmi 2309209',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.black.withOpacity(0.7),
                  ),
                ),
                const SizedBox(height: 16),
                _buildButtonSection(
                  context,
                  darkGreen: true,
                  buttonLabels: [
                    'Halaman Depan',
                    'Rincian Item',
                    'Chat',
                    'Wishlist',
                    'Keranjang & Checkout',
                    'Pembelian Paket',
                    'Review & Rating'
                  ],
                ),
                _buildButtonSection(
                  context,
                  darkGreen: false,
                  buttonLabels: [
                    'Transaksi',
                    'Monitor Pesanan',
                    'Pengembalian',
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildButtonSection(
    BuildContext context, {
    required bool darkGreen,
    required List<String> buttonLabels,
  }) {
    return Column(
      children: buttonLabels.map((label) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 4.0),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: darkGreen ? const Color(0xFF5E7562) : Colors.green[200],
              foregroundColor: Colors.white,
              minimumSize: const Size(double.infinity, 48),
            ),
            onPressed: () {
              if (label == 'Halaman Depan') {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomeScreen()),
                );
              } else if (label == 'Rincian Item') {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DetailItemScreen()),
                );
              } else if (label == 'Chat') {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ChatScreen()),
                );
              } 
              else if (label == 'Wishlist') {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => WishlistScreen()),
                );
              }
              else if (label == 'Keranjang & Checkout') {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ChartScreen()),
                );
            }
            },
            child: Text(label),
          ),
        );
      }).toList(),
    );
  }

  Widget _buildButton(BuildContext context, String label) {
    if (label == 'Transaksi') {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Text(
          label,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
      );
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      child: Container(
        width: double.infinity,
        height: 44,
        decoration: BoxDecoration(
          color: darkGreenColor,
          borderRadius: BorderRadius.circular(6),
        ),
        child: TextButton(
          onPressed: () {
            if (label == 'Rincian Item') {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const DetailItemScreen(),
                ),
              );
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('$label clicked')),
              );
            }
          },
          style: TextButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6),
            ),
          ),
          child: Text(
            label,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}

class HoverableGridItem extends StatefulWidget {
  final IconData icon;
  final String label;
  final bool isHeader;
  final bool useHeaderColor;
  final VoidCallback onTap;

  const HoverableGridItem({
    Key? key,
    required this.icon,
    required this.label,
    this.isHeader = false,
    this.useHeaderColor = false,
    required this.onTap,
  }) : super(key: key);

  @override
  State<HoverableGridItem> createState() => _HoverableGridItemState();
}

class _HoverableGridItemState extends State<HoverableGridItem> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final backgroundColor = widget.useHeaderColor
        ? QuizScreen.lightGreenColor
        : QuizScreen.darkGreenColor;
    
    final baseColor = widget.isHeader ? QuizScreen.lightGreenColor : backgroundColor;
    final hoverColor = baseColor.withOpacity(0.8);
    
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          decoration: BoxDecoration(
            color: _isHovered ? hoverColor : baseColor,
            borderRadius: BorderRadius.circular(6),
            boxShadow: _isHovered
                ? [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      blurRadius: 4,
                      offset: const Offset(0, 2),
                    )
                  ]
                : null,
            border: _isHovered
                ? Border.all(color: Colors.white.withOpacity(0.5), width: 2)
                : null,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                widget.icon,
                size: 36,
                color: Colors.white,
              ),
              const SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  widget.label,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: _isHovered ? FontWeight.bold : FontWeight.normal,
                  ),
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}