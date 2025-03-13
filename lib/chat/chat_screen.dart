import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    bool isMobile = MediaQuery.of(context).size.width < 800;

    return Scaffold(
      appBar: isMobile ? AppBar(title: const Text('Customer Service'), backgroundColor: const Color(0xFF5E7562)) : null,
      body: isMobile ? _buildMobileLayout() : _buildDesktopLayout(),
    );
  }

  Widget _buildMobileLayout() {
    return Column(
      children: [
        Expanded(
          child: ListView(
            padding: const EdgeInsets.symmetric(vertical: 10),
            children: [
              ChatBubble(isSender: false, message: 'Halo, saya sebagai assistant Anda di sini. Ada yang bisa saya bantu?'),
              ChatBubble(isSender: true, message: 'Halo'),
              ChatItem(isSender: true),
              ChatBubble(isSender: true, message: 'Bagaimana cara saya menyewa barang ini?'),
            ],
          ),
        ),
        ChatInputField(),
      ],
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
                  color: Colors.grey[200],
                  child: Column(
                    children: [
                      AppBar(title: const Text('Customer Service'), backgroundColor:const Color(0xFF5E7562)),
                      Expanded(
                        child: ListView(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          children: [
                            ChatBubble(isSender: false, message: 'Halo, saya sebagai assistant Anda di sini. Ada yang bisa saya bantu?'),
                            ChatBubble(isSender: true, message: 'Halo'),
                            ChatItem(isSender: true),
                            ChatBubble(isSender: true, message: 'Bagaimana cara saya menyewa barang ini?'),
                          ],
                        ),
                      ),
                      ChatInputField(),
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
          CircleAvatar(backgroundColor: const Color(0xFF5E7562), radius: 24, child: const Text('GO', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18))),
          const SizedBox(height: 16),
          const Text('NASAP CAMP', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
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
              Icon(icon, color: isSelected ? Colors.white : Colors.grey, size: 24),
              const SizedBox(width: 16),
              Text(label, style: TextStyle(color: isSelected ? Colors.white : Colors.grey, fontSize: 16, fontWeight: FontWeight.normal)),
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

  const ChatBubble({required this.isSender, required this.message, super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isSender ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 16),
        padding: const EdgeInsets.all(12),
        constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.6),
        decoration: BoxDecoration(color: isSender ? const Color(0xFF5E7562) : Colors.grey[300], borderRadius: BorderRadius.circular(12)),
        child: Text(message, style: TextStyle(color: isSender ? Colors.white : Colors.black)),
      ),
    );
  }
}

class ChatItem extends StatelessWidget {
  final bool isSender;

  const ChatItem({required this.isSender});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isSender ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 16),
        padding: const EdgeInsets.all(10),
        constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.4),
        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12), boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 5)]),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network('assets/image/tenda2.png', fit: BoxFit.cover, width: double.infinity, height: 100),
            ),
            const SizedBox(height: 8),
            const Text('Jaket Imago', style: TextStyle(fontWeight: FontWeight.bold)),
            const Text('Rp80.000,-', style: TextStyle(color: Colors.grey)),
          ],
        ),
      ),
    );
  }
}

class ChatInputField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(child: TextField(decoration: InputDecoration(hintText: 'Type your message...', border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))))),
          IconButton(icon: const Icon(Icons.send, color: const Color(0xFF5E7562)), onPressed: () {}),
        ],
      ),
    );
  }
}
