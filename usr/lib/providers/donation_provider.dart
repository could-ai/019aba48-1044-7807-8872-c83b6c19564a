import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/donation_models.dart';

class DonationProvider extends ChangeNotifier {
  DonationState _state = const DonationState();

  DonationState get state => _state;

  void updateCountry(String countryCode) {
    final config = countryConfigs[countryCode];
    if (config != null) {
      _state = _state.copyWith(
        selectedCountry: countryCode,
        selectedAmount: 0,
        selectedProvider: config.providers.isNotEmpty ? config.providers.first.code : null,
      );
      notifyListeners();
    }
  }

  void updateAmount(int amount) {
    _state = _state.copyWith(selectedAmount: amount);
    notifyListeners();
  }

  void updatePaymentMethod(String method) {
    _state = _state.copyWith(selectedPaymentMethod: method);
    notifyListeners();
  }

  void updateProvider(String provider) {
    _state = _state.copyWith(selectedProvider: provider);
    notifyListeners();
  }

  void updatePhoneNumber(String phoneNumber) {
    _state = _state.copyWith(phoneNumber: phoneNumber);
    notifyListeners();
  }

  void nextStep() {
    if (_state.currentStep < 3) {
      _state = _state.copyWith(currentStep: _state.currentStep + 1);
      notifyListeners();
    }
  }

  void previousStep() {
    if (_state.currentStep > 1) {
      _state = _state.copyWith(currentStep: _state.currentStep - 1);
      notifyListeners();
    }
  }

  void startProcessing() {
    _state = _state.copyWith(isProcessing: true);
    notifyListeners();
  }

  void stopProcessing() {
    _state = _state.copyWith(isProcessing: false);
    notifyListeners();
  }

  void completeDonation() {
    _state = _state.copyWith(currentStep: 3, isProcessing: false);
    notifyListeners();
  }

  void reset() {
    _state = const DonationState();
    notifyListeners();
  }

  CountryConfig? get currentConfig {
    if (_state.selectedCountry != null) {
      return countryConfigs[_state.selectedCountry];
    }
    return null;
  }

  String formatAmount(int amount) {
    final config = currentConfig;
    if (config != null) {
      return '${config.symbol} ${amount.toStringAsFixed(0).replaceAllMapped(
        RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
        (Match m) => '${m[1]},',
      )}';
    }
    return amount.toString();
  }

  List<String> getActiveImpacts() {
    final config = currentConfig;
    if (config != null) {
      return config.impacts
          .where((impact) => _state.selectedAmount >= impact.amount)
          .map((impact) => impact.name)
          .toList();
    }
    return [];
  }

  String getImpactMessage() {
    final activeImpacts = getActiveImpacts();
    if (activeImpacts.isNotEmpty) {
      return 'Fully funds: ${activeImpacts.join(', ')}';
    }
    return 'Every gift helps — thank you';
  }
}