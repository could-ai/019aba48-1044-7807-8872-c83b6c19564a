import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/donation_provider.dart';

class DonationSummary extends StatelessWidget {
  const DonationSummary({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<DonationProvider>(
      builder: (context, provider, child) {
        final currentConfig = provider.currentConfig;
        final amountText = provider.state.selectedAmount > 0 && currentConfig != null
            ? provider.formatAmount(provider.state.selectedAmount)
            : '--';

        return Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xFFfbfdff),
                Colors.white,
              ],
            ),
            border: Border.all(color: const Color(0x030f2342)),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Summary',
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Selected amount',
                style: TextStyle(
                  color: const Color(0xFF6b8199),
                  fontSize: 12,
                ),
              ),
              Text(
                amountText,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF0a1a2f),
                ),
              ),
              const SizedBox(height: 16),
              Text(
                'Country',
                style: TextStyle(
                  color: const Color(0xFF6b8199),
                  fontSize: 12,
                ),
              ),
              Text(
                currentConfig?.name ?? 'Not selected',
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                'Payment Method',
                style: TextStyle(
                  color: const Color(0xFF6b8199),
                  fontSize: 12,
                ),
              ),
              Text(
                _getPaymentMethodText(provider.state.selectedPaymentMethod),
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                'Impact highlight',
                style: TextStyle(
                  color: const Color(0xFF6b8199),
                  fontSize: 12,
                ),
              ),
              Text(
                provider.getImpactMessage(),
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 16),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: const [
                  _Badge(icon: Icons.shield, text: 'Secure'),
                  _Badge(icon: Icons.public, text: 'Local programs'),
                  _Badge(icon: Icons.people, text: 'Community-led'),
                ],
              ),
              const SizedBox(height: 24),
              Text(
                'Need help?',
                style: TextStyle(
                  color: const Color(0xFF6b8199),
                  fontSize: 12,
                ),
              ),
              const Text(
                'info@fsfoundation.org',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                'or call +256 700 000 000',
                style: TextStyle(
                  color: const Color(0xFF6b8199),
                  fontSize: 12,
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  String _getPaymentMethodText(String? method) {
    switch (method) {
      case 'mobile':
        return 'Mobile Money';
      case 'card':
        return 'Visa Card';
      default:
        return 'Not selected';
    }
  }
}

class _Badge extends StatelessWidget {
  final IconData icon;
  final String text;

  const _Badge({required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
      decoration: BoxDecoration(
        color: const Color(0x06ffffff),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            size: 12,
            color: const Color(0xFF0b2540),
          ),
          const SizedBox(width: 4),
          Text(
            text,
            style: TextStyle(
              color: const Color(0xFF0b2540),
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}