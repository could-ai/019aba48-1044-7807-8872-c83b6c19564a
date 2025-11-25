import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/donation_provider.dart';
import '../data/country_data.dart';

class StepCountryAmount extends StatefulWidget {
  const StepCountryAmount({super.key});

  @override
  State<StepCountryAmount> createState() => _StepCountryAmountState();
}

class _StepCountryAmountState extends State<StepCountryAmount> {
  final TextEditingController _customAmountController = TextEditingController();

  @override
  void dispose() {
    _customAmountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<DonationProvider>(
      builder: (context, provider, child) {
        final currentConfig = provider.currentConfig;
        final canContinue = provider.state.selectedCountry != null && provider.state.selectedAmount > 0;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Select your country',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              'Choose your country to see available payment options.',
              style: TextStyle(
                color: const Color(0xFF6b8199),
                fontSize: 14,
              ),
            ),
            const SizedBox(height: 16),
            // Country selector
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
              decoration: BoxDecoration(
                border: Border.all(color: const Color(0x120d6efd)),
                borderRadius: BorderRadius.circular(12),
              ),
              child: DropdownButton<String>(
                value: provider.state.selectedCountry,
                hint: const Text('-- Select Country --'),
                isExpanded: true,
                underline: const SizedBox(),
                items: getCountryCodes().map((code) {
                  return DropdownMenuItem<String>(
                    value: code,
                    child: Text(getCountryDisplayName(code)),
                  );
                }).toList(),
                onChanged: (value) {
                  if (value != null) {
                    provider.updateCountry(value);
                    _customAmountController.clear();
                  }
                },
              ),
            ),
            // Amount section
            if (currentConfig != null) ...[
              const SizedBox(height: 24),
              Text(
                'Choose an amount',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 8),
              // Currency info
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: const Color(0x050d6efd),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  'Currency: ${currentConfig.currency} (${currentConfig.symbol})',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              // Amount buttons
              Wrap(
                spacing: 10,
                runSpacing: 10,
                children: currentConfig.amounts.map((amount) {
                  final isSelected = provider.state.selectedAmount == amount;
                  return ElevatedButton(
                    onPressed: () {
                      provider.updateAmount(amount);
                      _customAmountController.clear();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: isSelected ? const Color(0xFF0d6efd) : Colors.white,
                      foregroundColor: isSelected ? Colors.white : const Color(0xFF0d6efd),
                      side: BorderSide(
                        color: const Color(0x120d6efd),
                        width: 1,
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
                      minimumSize: const Size(84, 0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(999),
                      ),
                      elevation: 0,
                      shadowColor: const Color(0x050d6efd),
                    ),
                    child: Text(
                      provider.formatAmount(amount),
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  );
                }).toList(),
              ),
              const SizedBox(height: 16),
              // Custom amount
              Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: TextField(
                      controller: _customAmountController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        hintText: 'Custom',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(999),
                          borderSide: const BorderSide(color: Color(0x120d6efd)),
                        ),
                        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                      ),
                      onChanged: (value) {
                        final amount = int.tryParse(value) ?? 0;
                        provider.updateAmount(amount);
                      },
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    flex: 3,
                    child: Text(
                      'Enter custom amount',
                      style: TextStyle(
                        color: const Color(0xFF6b8199),
                        fontSize: 14,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              // Impact section
              Text(
                'What your donation can do',
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 12),
              Column(
                children: currentConfig.impacts.map((impact) {
                  final isActive = provider.state.selectedAmount >= impact.amount;
                  return Container(
                    margin: const EdgeInsets.only(bottom: 12),
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.white,
                          const Color(0xFFfbfdff),
                        ],
                      ),
                      border: Border.all(
                        color: isActive ? const Color(0x1834d399) : const Color(0x030f2342),
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                impact.name,
                                style: const TextStyle(
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const SizedBox(height: 2),
                              Text(
                                impact.description,
                                style: TextStyle(
                                  color: const Color(0xFF6b8199),
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 12),
                        Text(
                          provider.formatAmount(impact.amount),
                          style: TextStyle(
                            color: const Color(0xFF6b8199),
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  );
                }).toList(),
              ),
              const SizedBox(height: 24),
              // Continue button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: canContinue ? () => provider.nextStep() : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF0d6efd),
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(999),
                    ),
                  ),
                  child: const Text(
                    'Continue',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ],
          ],
        );
      },
    );
  }
}