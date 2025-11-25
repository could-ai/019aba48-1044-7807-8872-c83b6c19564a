class CountryConfig {
  final String code;
  final String name;
  final String currency;
  final String symbol;
  final List<int> amounts;
  final List<Impact> impacts;
  final List<Provider> providers;

  const CountryConfig({
    required this.code,
    required this.name,
    required this.currency,
    required this.symbol,
    required this.amounts,
    required this.impacts,
    required this.providers,
  });
}

class Impact {
  final String name;
  final int amount;
  final String description;

  const Impact({
    required this.name,
    required this.amount,
    required this.description,
  });
}

class Provider {
  final String code;
  final String name;
  final String phoneFormat;

  const Provider({
    required this.code,
    required this.name,
    required this.phoneFormat,
  });
}

class DonationState {
  final int currentStep;
  final String? selectedCountry;
  final int selectedAmount;
  final String? selectedPaymentMethod;
  final String? selectedProvider;
  final String? phoneNumber;
  final bool isProcessing;

  const DonationState({
    this.currentStep = 1,
    this.selectedCountry,
    this.selectedAmount = 0,
    this.selectedPaymentMethod,
    this.selectedProvider,
    this.phoneNumber,
    this.isProcessing = false,
  });

  DonationState copyWith({
    int? currentStep,
    String? selectedCountry,
    int? selectedAmount,
    String? selectedPaymentMethod,
    String? selectedProvider,
    String? phoneNumber,
    bool? isProcessing,
  }) {
    return DonationState(
      currentStep: currentStep ?? this.currentStep,
      selectedCountry: selectedCountry ?? this.selectedCountry,
      selectedAmount: selectedAmount ?? this.selectedAmount,
      selectedPaymentMethod: selectedPaymentMethod ?? this.selectedPaymentMethod,
      selectedProvider: selectedProvider ?? this.selectedProvider,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      isProcessing: isProcessing ?? this.isProcessing,
    );
  }
}