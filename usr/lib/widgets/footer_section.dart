import 'package:flutter/material.dart';

class FooterSection extends StatelessWidget {
  const FooterSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
      decoration: BoxDecoration(
        color: const Color(0xFF0a1a2f),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Fredirck Sseruyange Foundation',
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Empowering communities through education, water & health.',
                  style: TextStyle(
                    color: const Color(0xFFc9d6ff),
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 16),
          Text(
            '© ${DateTime.now().year} Fredirck Sseruyange Foundation — All Rights Reserved.',
            style: TextStyle(
              color: const Color(0xFFc9d6ff),
              fontSize: 12,
            ),
          ),
          const SizedBox(width: 16),
          Row(
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.facebook, color: Colors.white),
                iconSize: 20,
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.camera_alt, color: Colors.white), // Instagram icon
                iconSize: 20,
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.chat, color: Colors.white), // Twitter icon
                iconSize: 20,
              ),
            ],
          ),
        ],
      ),
    );
  }
}