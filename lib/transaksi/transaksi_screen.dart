import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rental App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
        scaffoldBackgroundColor: Color(0xFFF5F5F5),
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        textTheme: GoogleFonts.robotoTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      home: TransactionsScreen(),
    );
  }
}

class TransactionsScreen extends StatefulWidget {
  @override
  _TransactionsScreenState createState() => _TransactionsScreenState();
}

class _TransactionsScreenState extends State<TransactionsScreen> {
  String selectedFilter = 'Semua';
  int _selectedIndex = 0; // Untuk navigasi sidebar

  @override
  Widget build(BuildContext context) {
    bool isMobile = MediaQuery.of(context).size.width < 800;

    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: isMobile ? _buildMobileLayout() : _buildDesktopLayout(),
      bottomNavigationBar: isMobile ? _buildMobileBottomNavigation() : null,
    );
  }

  Widget _buildMobileLayout() {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(
                top: 50.0, left: 24.0, right: 16.0, bottom: 16.0),
            child: Text(
              'Transactions',
              style: GoogleFonts.roboto(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  FilterButton(
                    text: 'Semua',
                    isSelected: selectedFilter == 'Semua',
                    onTap: () {
                      setState(() {
                        selectedFilter = 'Semua';
                      });
                    },
                  ),
                  SizedBox(width: 8),
                  FilterButton(
                    text: 'On Book',
                    isSelected: selectedFilter == 'On Book',
                    onTap: () {
                      setState(() {
                        selectedFilter = 'On Book';
                      });
                    },
                  ),
                  SizedBox(width: 8),
                  FilterButton(
                    text: 'Returned',
                    isSelected: selectedFilter == 'Returned',
                    onTap: () {
                      setState(() {
                        selectedFilter = 'Returned';
                      });
                    },
                  ),
                  SizedBox(width: 8),
                  FilterButton(
                    text: 'Not Returne',
                    isSelected: selectedFilter == 'Not Returne',
                    onTap: () {
                      setState(() {
                        selectedFilter = 'Not Returne';
                      });
                    },
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 16),
          Expanded(
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              children: [
                BookingCard(
                  bookingCode: 'BX12423749',
                  status: 'ON BOOK',
                  bookingDate: '13/03/2025',
                  returnDate: '17/03/2025',
                  items: [
                    BookedItem(
                      name: 'Tenda OZtrail',
                      quantity: 1,
                      imageColor: Color(0xFFB5D1B5),
                    ),
                    BookedItem(
                      name: 'Jaket Imago',
                      quantity: 1,
                      imageColor: Color(0xFFF5EEC2),
                    ),
                  ],
                ),
                SizedBox(height: 16),
                BookingCard(
                  bookingCode: 'BX48484839',
                  status: 'RETURNED',
                  statusColor: Colors.grey,
                  bookingDate: '13/03/2025',
                  returnDate: '17/03/2025',
                  items: [
                    BookedItem(
                      name: 'Tenda OZtrail',
                      quantity: 1,
                      imageColor: Color(0xFFB5D1B5),
                    ),
                    BookedItem(
                      name: 'Jaket Imago',
                      quantity: 1,
                      imageColor: Color(0xFFF5EEC2),
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

  Widget _buildDesktopLayout() {
    return Row(
      children: [
        _buildDesktopSideNavigation(),
        Expanded(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(32.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildDesktopHeader(),
                  SizedBox(height: 24),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          FilterButton(
                            text: 'Semua',
                            isSelected: selectedFilter == 'Semua',
                            onTap: () {
                              setState(() {
                                selectedFilter = 'Semua';
                              });
                            },
                          ),
                          SizedBox(width: 8),
                          FilterButton(
                            text: 'On Book',
                            isSelected: selectedFilter == 'On Book',
                            onTap: () {
                              setState(() {
                                selectedFilter = 'On Book';
                              });
                            },
                          ),
                          SizedBox(width: 8),
                          FilterButton(
                            text: 'Returned',
                            isSelected: selectedFilter == 'Returned',
                            onTap: () {
                              setState(() {
                                selectedFilter = 'Returned';
                              });
                            },
                          ),
                          SizedBox(width: 8),
                          FilterButton(
                            text: 'Not Returne',
                            isSelected: selectedFilter == 'Not Returne',
                            onTap: () {
                              setState(() {
                                selectedFilter = 'Not Returne';
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  ..._buildDesktopBookingCards(),
                ],
              ),
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
    child: Column(
      children: [
        const SizedBox(height: 32),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            children: [
              CircleAvatar(
                backgroundColor: const Color(0xFF538156),
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
              const SizedBox(width: 16),
              const Text(
                'NASAP CAMP',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 48),
        _buildDesktopNavItem(Icons.dashboard, 'Dashboard', 0),
        _buildDesktopNavItem(Icons.shopping_cart, 'Products', 1),
        _buildDesktopNavItem(Icons.home, 'Home', 2),
        _buildDesktopNavItem(Icons.chat, 'Chat', 3),
        _buildDesktopNavItem(Icons.favorite, 'Wishlist', 4),
        _buildDesktopNavItem(Icons.receipt_long, 'Transaksi', 5, isSelected: true), // Ubah ini
        const Spacer(),
        _buildDesktopNavItem(Icons.shopping_basket, 'Keranjang', 6, isSelected: false), // Ubah ini
        const SizedBox(height: 24),
      ],
    ),
  );
}

  Widget _buildDesktopNavItem(IconData icon, String label, int index, {bool isSelected = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: InkWell(
        onTap: () {
          setState(() {
            _selectedIndex = index;
          });
        },
        borderRadius: BorderRadius.circular(12),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
          decoration: BoxDecoration(
            color: isSelected ? const Color(0xFF538156) : Colors.transparent,
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
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDesktopHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Transactions',
          style: GoogleFonts.roboto(
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  List<Widget> _buildDesktopBookingCards() {
    return [
      BookingCard(
        bookingCode: 'BX12423749',
        status: 'ON BOOK',
        bookingDate: '13/03/2025',
        returnDate: '17/03/2025',
        items: [
          BookedItem(
            name: 'Tenda OZtrail',
            quantity: 1,
            imageColor: Color(0xFFB5D1B5),
          ),
          BookedItem(
            name: 'Jaket Imago',
            quantity: 1,
            imageColor: Color(0xFFF5EEC2),
          ),
        ],
      ),
      SizedBox(height: 16),
      BookingCard(
        bookingCode: 'BX48484839',
        status: 'RETURNED',
        statusColor: Colors.grey,
        bookingDate: '13/03/2025',
        returnDate: '17/03/2025',
        items: [
          BookedItem(
            name: 'Tenda OZtrail',
            quantity: 1,
            imageColor: Color(0xFFB5D1B5),
          ),
          BookedItem(
            name: 'Jaket Imago',
            quantity: 1,
            imageColor: Color(0xFFF5EEC2),
          ),
        ],
      ),
    ];
  }

  Widget _buildMobileBottomNavigation() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 10,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildNavItem(Icons.article_outlined, 0),
            _buildNavItem(Icons.shopping_cart_outlined, 1),
            _buildHomeNavItem(),
            _buildNavItem(Icons.chat_bubble_outline, 3),
            _buildNavItem(Icons.favorite_border, 4),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem(IconData icon, int index) {
    final isSelected = _selectedIndex == index;
    return IconButton(
      icon: Icon(
        icon,
        color: isSelected ? const Color(0xFF538156) : Colors.grey,
        size: 28,
      ),
      onPressed: () {
        setState(() {
          _selectedIndex = index;
        });
      },
    );
  }

  Widget _buildHomeNavItem() {
    final isSelected = _selectedIndex == 2;
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedIndex = 2;
        });
      },
      child: Container(
        width: 56,
        height: 56,
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFF538156) : Colors.grey,
          shape: BoxShape.circle,
        ),
        child: const Icon(
          Icons.home,
          color: Colors.white,
          size: 30,
        ),
      ),
    );
  }
}

class FilterButton extends StatelessWidget {
  final String text;
  final bool isSelected;
  final VoidCallback onTap;

  const FilterButton({
    Key? key,
    required this.text,
    required this.isSelected,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? Colors.black : Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          text,
          style: GoogleFonts.roboto(
            color: isSelected ? Colors.white : Colors.black,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ),
    );
  }
}

class BookingCard extends StatelessWidget {
  final String bookingCode;
  final String status;
  final Color statusColor;
  final String bookingDate;
  final String returnDate;
  final List<BookedItem> items;

  const BookingCard({
    Key? key,
    required this.bookingCode,
    required this.status,
    this.statusColor = Colors.green,
    required this.bookingDate,
    required this.returnDate,
    required this.items,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(
                top: 30.0, left: 20.0, right: 20.0, bottom: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Booking Code: $bookingCode',
                  style: GoogleFonts.roboto(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  status,
                  style: GoogleFonts.roboto(
                    color: statusColor,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          ...items.map((item) => ItemTile(item: item)).toList(),
          Divider(height: 1),
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Booking Date:'),
                    SizedBox(height: 8),
                    Text('Return Date:'),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      bookingDate,
                      style: GoogleFonts.roboto(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 8),
                    Text(
                      returnDate,
                      style: GoogleFonts.roboto(fontWeight: FontWeight.bold),
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
}

class BookedItem {
  final String name;
  final int quantity;
  final Color imageColor;

  const BookedItem({
    required this.name,
    required this.quantity,
    required this.imageColor,
  });
}

class ItemTile extends StatelessWidget {
  final BookedItem item;

  const ItemTile({
    Key? key,
    required this.item,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 24.0,
        right: 16.0,
        top: 8.0,
        bottom: 24.0,
      ),
      child: Row(
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: item.imageColor,
              borderRadius: BorderRadius.circular(8),
            ),
            child: item.name.contains('Tenda')
                ? Icon(Icons.home_work_outlined, color: Colors.grey[700])
                : Icon(Icons.local_offer_outlined, color: Colors.grey[700]),
          ),
          SizedBox(width: 16),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: item.name,
                  style: TextStyle(
                    fontFamily: 'MPLUSRounded1c',
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                TextSpan(
                  text: ' (${item.quantity}x)',
                  style: TextStyle(
                    fontFamily: 'MPLUSRounded1c',
                    fontWeight: FontWeight.normal,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}