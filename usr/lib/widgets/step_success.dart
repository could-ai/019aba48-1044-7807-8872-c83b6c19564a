import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/donation_provider.dart';

class StepSuccess extends StatelessWidget {
  const StepSuccess({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<DonationProvider>(
      builder: (context, provider, child) {
        final currentConfig = provider.currentConfig;
        final amountText = currentConfig != null
            ? provider.formatAmount(provider.state.selectedAmount)
            : '$${provider.state.selectedAmount}';

        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                '✅',
                style: TextStyle(fontSize: 56),
              ),
              const SizedBox(height: 16),
              Text(
                'Thank you!',
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Your donation of $amountText has been received. Thank you!',
                style: TextStyle(
                  color: const Color(0xFF6b8199),
                  fontSize: 14,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 24),
              SizedBox(
                width: 200,
                child: OutlinedButton(
                  onPressed: () => provider.reset(),
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(999),
                    ),
                    side: const BorderSide(color: Color(0xFF0d6efd)),
                  ),
                  child: const Text(
                    'Make another donation',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF0d6efd),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}