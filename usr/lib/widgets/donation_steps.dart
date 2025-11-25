import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/donation_provider.dart';
import 'step_country_amount.dart';
import 'step_payment.dart';
import 'step_success.dart';

class DonationSteps extends StatelessWidget {
  const DonationSteps({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<DonationProvider>(
      builder: (context, provider, child) {
        return Container(
          padding: const EdgeInsets.all(22),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: const [
              BoxShadow(
                color: Color(0x040f2342),
                blurRadius: 28,
                offset: Offset(0, 8),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Progress indicator
              Container(
                margin: const EdgeInsets.only(bottom: 12),
                child: Row(
                  children: [
                    Text(
                      'Step',
                      style: TextStyle(
                        fontSize: 14,
                        color: const Color(0xFF425a76),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Container(
                        height: 10,
                        decoration: BoxDecoration(
                          color: const Color(0x120d6efd),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: FractionallySizedBox(
                          alignment: Alignment.centerLeft,
                          widthFactor: (provider.state.currentStep - 1) / 2,
                          child: Container(
                            decoration: BoxDecoration(
                              color: const Color(0xFF0d6efd),
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Text(
                      '${provider.state.currentStep} / 3',
                      style: TextStyle(
                        fontSize: 14,
                        color: const Color(0xFF6b8199),
                      ),
                    ),
                  ],
                ),
              ),
              // Step content
              AnimatedSwitcher(
                duration: const Duration(milliseconds: 300),
                child: _buildCurrentStep(provider.state.currentStep),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildCurrentStep(int step) {
    switch (step) {
      case 1:
        return const StepCountryAmount(key: ValueKey(1));
      case 2:
        return const StepPayment(key: ValueKey(2));
      case 3:
        return const StepSuccess(key: ValueKey(3));
      default:
        return const StepCountryAmount(key: ValueKey(1));
    }
  }
}