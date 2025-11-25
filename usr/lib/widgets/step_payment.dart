import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/donation_provider.dart';

class StepPayment extends StatefulWidget {
  const StepPayment({super.key});

  @override
  State<StepPayment> createState() => _StepPaymentState();
}

class _StepPaymentState extends State<StepPayment> {
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _cardNumberController = TextEditingController();
  final TextEditingController _cardNameController = TextEditingController();
  final TextEditingController _cardExpiryController = TextEditingController();
  final TextEditingController _cardCvvController = TextEditingController();

  @override
  void dispose() {
    _phoneController.dispose();
    _cardNumberController.dispose();
    _cardNameController.dispose();
    _cardExpiryController.dispose();
    _cardCvvController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<DonationProvider>(
      builder: (context, provider, child) {
        final currentConfig = provider.currentConfig;
        if (currentConfig == null) return const SizedBox();

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Choose payment method',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              'Select how you\'d like to donate.',
              style: TextStyle(
                color: const Color(0xFF6b8199),
                fontSize: 14,
              ),
            ),
            const SizedBox(height: 20),
            // Payment method tabs
            Row(
              children: [
                _PaymentTab(
                  icon: Icons.phone,
                  label: 'Mobile Money',
                  isActive: provider.state.selectedPaymentMethod == 'mobile',
                  onTap: () => provider.updatePaymentMethod('mobile'),
                ),
                const SizedBox(width: 12),
                _PaymentTab(
                  icon: Icons.credit_card,
                  label: 'Visa Card',
                  isActive: provider.state.selectedPaymentMethod == 'card',
                  onTap: () => provider.updatePaymentMethod('card'),
                ),
              ],
            ),
            const SizedBox(height: 16),
            // Payment method content
            if (provider.state.selectedPaymentMethod == 'mobile') ...[
              // Mobile Money Payment
              Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: DropdownButtonFormField<String>(
                      value: provider.state.selectedProvider,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(color: Color(0x120d6efd)),
                        ),
                        contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                      ),
                      items: currentConfig.providers.map((provider) {
                        return DropdownMenuItem<String>(
                          value: provider.code,
                          child: Text(provider.name),
                        );
                      }).toList(),
                      onChanged: (value) {
                        if (value != null) {
                          provider.updateProvider(value);
                        }
                      },
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    flex: 3,
                    child: TextField(
                      controller: _phoneController,
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                        hintText: 'Enter phone number',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(color: Color(0x120d6efd)),
                        ),
                        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                      ),
                      onChanged: (value) => provider.updatePhoneNumber(value),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                _getPhoneHint(provider.state.selectedProvider, currentConfig.providers),
                style: TextStyle(
                  color: const Color(0xFF6b8199),
                  fontSize: 12,
                ),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Donation amount',
                    style: TextStyle(
                      color: const Color(0xFF6b8199),
                      fontSize: 14,
                    ),
                  ),
                  Text(
                    provider.formatAmount(provider.state.selectedAmount),
                    style: const TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF0a1a2f),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: provider.state.isProcessing
                          ? null
                          : () => _processMobilePayment(provider),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF198754),
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(999),
                        ),
                      ),
                      child: provider.state.isProcessing
                          ? const SizedBox(
                              width: 16,
                              height: 16,
                              child: CircularProgressIndicator(
                                strokeWidth: 2,
                                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                              ),
                            )
                          : const Text(
                              'Pay with Mobile Money',
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                              ),
                            ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  TextButton(
                    onPressed: () => provider.previousStep(),
                    style: TextButton.styleFrom(
                      padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 10),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(999),
                        side: const BorderSide(color: Color(0xFF6c757d)),
                      ),
                    ),
                    child: const Text(
                      'Back',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF6c757d),
                      ),
                    ),
                  ),
                ],
              ),
            ] else if (provider.state.selectedPaymentMethod == 'card') ...[
              // Card Payment
              TextField(
                controller: _cardNumberController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Card Number',
                  hintText: '1234 5678 9012 3456',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: Color(0x120d6efd)),
                  ),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  suffixIcon: const Icon(Icons.credit_card, color: Color(0xFF6b8199)),
                ),
                onChanged: (value) {
                  // Format card number
                  String formatted = value.replaceAll(RegExp(r'\s+'), '');
                  if (formatted.length > 16) formatted = formatted.substring(0, 16);
                  formatted = formatted.replaceAllMapped(
                    RegExp(r'.{4}'),
                    (match) => '${match.group(0)} ',
                  ).trim();
                  _cardNumberController.value = TextEditingValue(
                    text: formatted,
                    selection: TextSelection.collapsed(offset: formatted.length),
                  );
                },
              ),
              const SizedBox(height: 16),
              TextField(
                controller: _cardNameController,
                textCapitalization: TextCapitalization.words,
                decoration: InputDecoration(
                  labelText: 'Cardholder Name',
                  hintText: 'John Doe',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: Color(0x120d6efd)),
                  ),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                ),
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _cardExpiryController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: 'Expiry Date',
                        hintText: 'MM/YY',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(color: Color(0x120d6efd)),
                        ),
                        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                      ),
                      onChanged: (value) {
                        String formatted = value.replaceAll(RegExp(r'[^0-9]'), '');
                        if (formatted.length >= 2) {
                          formatted = '${formatted.substring(0, 2)}/${formatted.substring(2, formatted.length > 4 ? 4 : null)}';
                        }
                        if (formatted.length > 5) formatted = formatted.substring(0, 5);
                        _cardExpiryController.value = TextEditingValue(
                          text: formatted,
                          selection: TextSelection.collapsed(offset: formatted.length),
                        );
                      },
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: TextField(
                      controller: _cardCvvController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: 'CVV',
                        hintText: '123',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(color: Color(0x120d6efd)),
                        ),
                        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                      ),
                      onChanged: (value) {
                        String formatted = value.replaceAll(RegExp(r'[^0-9]'), '');
                        if (formatted.length > 3) formatted = formatted.substring(0, 3);
                        _cardCvvController.value = TextEditingValue(
                          text: formatted,
                          selection: TextSelection.collapsed(offset: formatted.length),
                        );
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Donation amount',
                    style: TextStyle(
                      color: const Color(0xFF6b8199),
                      fontSize: 14,
                    ),
                  ),
                  Text(
                    provider.formatAmount(provider.state.selectedAmount),
                    style: const TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF0a1a2f),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: provider.state.isProcessing
                          ? null
                          : () => _processCardPayment(provider),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF198754),
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(999),
                        ),
                      ),
                      child: provider.state.isProcessing
                          ? const SizedBox(
                              width: 16,
                              height: 16,
                              child: CircularProgressIndicator(
                                strokeWidth: 2,
                                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                              ),
                            )
                          : const Text(
                              'Pay with Card',
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                              ),
                            ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  TextButton(
                    onPressed: () => provider.previousStep(),
                    style: TextButton.styleFrom(
                      padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 10),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(999),
                        side: const BorderSide(color: Color(0xFF6c757d)),
                      ),
                    ),
                    child: const Text(
                      'Back',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF6c757d),
                      ),
                    ),
                  ),
                ],
              ),
            ],
            const SizedBox(height: 16),
            Text(
              'By continuing you agree to our terms and privacy policy.',
              style: TextStyle(
                color: const Color(0xFF6b8199),
                fontSize: 12,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        );
      },
    );
  }

  String _getPhoneHint(String? providerCode, List providers) {
    if (providerCode != null) {
      final provider = providers.firstWhere(
        (p) => p.code == providerCode,
        orElse: () => null,
      );
      if (provider != null) {
        return 'Enter your mobile money number (format: ${provider.phoneFormat})';
      }
    }
    return 'Enter your mobile money number';
  }

  Future<void> _processMobilePayment(DonationProvider provider) async {
    if (provider.state.phoneNumber?.isEmpty ?? true) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter a valid phone number')),
      );
      return;
    }

    provider.startProcessing();

    // Simulate payment processing
    await Future.delayed(const Duration(seconds: 3));

    provider.completeDonation();
  }

  Future<void> _processCardPayment(DonationProvider provider) async {
    if (_cardNumberController.text.isEmpty ||
        _cardNameController.text.isEmpty ||
        _cardExpiryController.text.isEmpty ||
        _cardCvvController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fill in all card details')),
      );
      return;
    }

    provider.startProcessing();

    // Simulate payment processing
    await Future.delayed(const Duration(seconds: 3));

    provider.completeDonation();
  }
}

class _PaymentTab extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isActive;
  final VoidCallback onTap;

  const _PaymentTab({
    required this.icon,
    required this.label,
    required this.isActive,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          decoration: BoxDecoration(
            color: Colors.transparent,
            border: Border(
              bottom: BorderSide(
                color: isActive ? const Color(0xFF0d6efd) : const Color(0x120d6efd),
                width: 3,
              ),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: 16,
                color: isActive ? const Color(0xFF0d6efd) : const Color(0xFF6b8199),
              ),
              const SizedBox(width: 8),
              Text(
                label,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: isActive ? const Color(0xFF0d6efd) : const Color(0xFF6b8199),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}