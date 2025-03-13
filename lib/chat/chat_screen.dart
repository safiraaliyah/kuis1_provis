import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    bool isMobile = MediaQuery.of(context).size.width < 800;

    return Scaffold(
      backgroundColor: const Color(0xFFF9F9F7),
      appBar: isMobile ? _buildMobileAppBar(context) : null,
      body: isMobile ? _buildMobileLayout() : _buildDesktopLayout(),
    );
  }

  PreferredSizeWidget _buildMobileAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back_ios, color: Colors.black, size: 20),
        onPressed: () => Navigator.pop(context),
      ),
      title: Row(
        children: [
          CircleAvatar(backgroundColor: Colors.grey[300], radius: 16),
          const SizedBox(width: 12),
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Customer Service',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'Online',
                style: TextStyle(color: Colors.grey, fontSize: 12),
              ),
            ],
          ),
        ],
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.more_vert, color: Colors.black),
          onPressed: () {},
        ),
      ],
      centerTitle: false,
    );
  }

  Widget _buildMobileLayout() {
    return Column(
      children: [
        Expanded(
          child: ListView(
            padding: const EdgeInsets.symmetric(vertical: 10),
            children: [
              _buildTimeStamp('13.00'),
              const SizedBox(height: 8),
              ChatBubble(isSender: true, message: 'Halo', showTime: false),
              const SizedBox(height: 8),
              ChatBubble(
                isSender: false,
                message:
                    'Halo, saya sebagai assistant Anda di sini. Ada yang bisa saya bantu?',
                showTime: true,
              ),
              const SizedBox(height: 8),
              _buildTimeStamp('13.00'),
              const SizedBox(height: 8),
              ProductChatItem(isSender: true),
              const SizedBox(height: 8),
              _buildTimeStamp('13.00'),
              const SizedBox(height: 8),
              ChatBubble(
                isSender: true,
                message: 'Bagaimana cara saya menyewa barang ini?',
                showTime: false,
              ),
            ],
          ),
        ),
        _buildChatInputField(),
      ],
    );
  }

  Widget _buildTimeStamp(String time) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Text(
          time,
          style: TextStyle(color: Colors.grey[600], fontSize: 12),
        ),
      ),
    );
  }

  Widget _buildChatInputField() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 12.0),
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
          IconButton(
            icon: const Icon(Icons.attach_file, color: Colors.grey),
            onPressed: () {},
          ),
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Type your message...',
                hintStyle: TextStyle(color: Colors.grey[500]),
                border: InputBorder.none,
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 10,
                ),
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: const Color(0xFF5E7562),
              shape: BoxShape.circle,
            ),
            child: IconButton(
              icon: const Icon(Icons.mic, color: Colors.white),
              onPressed: () {},
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
          child: Column(
            children: [
              Expanded(
                child: Container(
                  color: const Color(0xFFF9F9F7),
                  child: Column(
                    children: [
                      AppBar(
                        title: Text(
                          'Customer Service',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        backgroundColor:
                            Colors.white, // Ubah dari hijau ke putih
                        foregroundColor:
                            Colors.black, // Untuk teks berwarna hitam
                        elevation: 0,
                      ),
                      Expanded(
                        child: ListView(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          children: [
                            ChatBubble(
                              isSender: false,
                              message:
                                  'Halo, saya sebagai assistant Anda di sini. Ada yang bisa saya bantu?',
                              showTime: true,
                            ),
                            ChatBubble(
                              isSender: true,
                              message: 'Halo',
                              showTime: false,
                            ),
                            ProductChatItem(isSender: true),
                            ChatBubble(
                              isSender: true,
                              message:
                                  'Bagaimana cara saya menyewa barang ini?',
                              showTime: false,
                            ),
                          ],
                        ),
                      ),
                      _buildChatInputField(),
                    ],
                  ),
                ),
              ),
            ],
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
            'NASAP CAMP',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          const SizedBox(height: 48),
          _buildDesktopNavItem(Icons.home, 'Home', true),
          _buildDesktopNavItem(Icons.chat, 'Chat', false),
          _buildDesktopNavItem(Icons.favorite, 'Wishlist', false),
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
}
class ChatBubble extends StatelessWidget {
  final bool isSender;
  final String message;
  final bool showTime;

  const ChatBubble({
    required this.isSender,
    required this.message,
    required this.showTime,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isSender ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width * 0.6, // Batasi lebar maksimum
        ),
        margin: EdgeInsets.only(
          left: isSender ? 80 : 16,
          right: isSender ? 16 : 80,
        ),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: isSender ? Colors.white : Colors.black87,
          borderRadius: BorderRadius.circular(16),
          boxShadow: isSender
              ? [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 3,
                    offset: const Offset(0, 1),
                  )
                ]
              : null,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              message,
              style: TextStyle(
                color: isSender ? Colors.black : Colors.white,
                fontSize: 14,
              ),
            ),
            if (showTime) ...[
              const SizedBox(height: 4),
              Align(
                alignment: Alignment.bottomRight,
                child: Text(
                  '13.00',
                  style: TextStyle(
                    color: isSender ? Colors.grey : Colors.white70,
                    fontSize: 10,
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class ProductChatItem extends StatelessWidget {
  final bool isSender;

  const ProductChatItem({required this.isSender, super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isSender ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width * 0.4, // Batasi lebar maksimum
        ),
        margin: EdgeInsets.only(
          left: isSender ? 80 : 16,
          right: isSender ? 16 : 80,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 3,
              offset: const Offset(0, 1),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(16),
              ),
              child: Image.asset(
                'assets/image/tenda2.png',
                fit: BoxFit.cover,
                width: double.infinity,
                height: 100, // Perkecil tinggi gambar
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    width: double.infinity,
                    height: 100,
                    color: Colors.grey[300],
                    child: const Center(
                      child: Icon(
                        Icons.image_not_supported,
                        color: Colors.grey,
                      ),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Jaket Imago',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    'Rp80.000,-',
                    style: TextStyle(color: Colors.grey, fontSize: 14),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}