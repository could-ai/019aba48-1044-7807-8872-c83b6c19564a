import 'package:flutter/material.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(22),
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [
            Color(0x330d6efd),
            Color(0x020a1a2f),
          ],
        ),
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(
            color: Color(0x060d6efd),
            blurRadius: 30,
            offset: Offset(0, 8),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 68,
            height: 68,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color(0xFF0d6efd),
                  Color(0xFF1e3a8a),
                ],
              ),
              borderRadius: BorderRadius.circular(12),
              boxShadow: const [
                BoxShadow(
                  color: Color(0x150d6efd),
                  blurRadius: 18,
                  offset: Offset(0, 6),
                ),
              ],
            ),
            alignment: Alignment.center,
            child: const Text(
              'FS',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          const SizedBox(width: 18),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Support Fredirck Sseruyange Foundation',
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.w700,
                    fontSize: 18,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Your gift helps provide clean water, education, and health services to vulnerable communities across Africa.',
                  style: TextStyle(
                    color: const Color(0xFF274060),
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 18),
          Container(
            constraints: const BoxConstraints(minWidth: 200),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  'Secure payments • Card & Mobile Money',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: const Color(0xFF6b8199),
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                      decoration: BoxDecoration(
                        color: const Color(0x06ffffff),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.lock,
                            size: 12,
                            color: Color(0xFF0b2540),
                          ),
                          const SizedBox(width: 4),
                          Text(
                            'SSL Secured',
                            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: const Color(0xFF0b2540),
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 8),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                      decoration: BoxDecoration(
                        color: const Color(0x06ffffff),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.public,
                            size: 12,
                            color: Color(0xFF0b2540),
                          ),
                          const SizedBox(width: 4),
                          Text(
                            'Pan-African',
                            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: const Color(0xFF0b2540),
                              fontSize: 12,
                            ),
                          ),
                        ],
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
}