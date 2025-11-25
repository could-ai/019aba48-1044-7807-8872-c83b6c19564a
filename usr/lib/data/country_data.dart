import '../models/donation_models.dart';

final Map<String, CountryConfig> countryConfigs = {
  'UGA': const CountryConfig(
    code: 'UGA',
    name: 'Uganda',
    currency: 'UGX',
    symbol: 'UGX',
    amounts: [10000, 20000, 50000, 100000, 200000],
    impacts: [
      Impact(name: 'Clean Water', amount: 10000, description: 'Provides safe drinking water'),
      Impact(name: 'School Supplies', amount: 50000, description: 'Books & uniforms'),
      Impact(name: 'Healthcare', amount: 100000, description: 'Essential medical kits'),
    ],
    providers: [
      Provider(code: 'MTN_MOMO_UGA', name: 'MTN Uganda', phoneFormat: '256XXXXXXXXX'),
      Provider(code: 'AIRTEL_OAPI_UGA', name: 'Airtel Uganda', phoneFormat: '256XXXXXXXXX'),
    ],
  ),
  'KEN': const CountryConfig(
    code: 'KEN',
    name: 'Kenya',
    currency: 'KES',
    symbol: 'KSh',
    amounts: [100, 500, 1000, 2000, 5000],
    impacts: [
      Impact(name: 'Clean Water', amount: 100, description: 'Provides safe drinking water'),
      Impact(name: 'School Supplies', amount: 500, description: 'Books & uniforms'),
      Impact(name: 'Healthcare', amount: 1000, description: 'Essential medical kits'),
    ],
    providers: [
      Provider(code: 'MPESA_KEN', name: 'M-Pesa Kenya', phoneFormat: '254XXXXXXXXX'),
    ],
  ),
  'TZA': const CountryConfig(
    code: 'TZA',
    name: 'Tanzania',
    currency: 'TZS',
    symbol: 'TZS',
    amounts: [10000, 25000, 50000, 100000, 200000],
    impacts: [
      Impact(name: 'Clean Water', amount: 10000, description: 'Provides safe drinking water'),
      Impact(name: 'School Supplies', amount: 50000, description: 'Books & uniforms'),
      Impact(name: 'Healthcare', amount: 100000, description: 'Essential medical kits'),
    ],
    providers: [
      Provider(code: 'AIRTEL_TZA', name: 'Airtel Tanzania', phoneFormat: '255XXXXXXXXX'),
      Provider(code: 'VODACOM_TZA', name: 'Vodacom Tanzania', phoneFormat: '255XXXXXXXXX'),
      Provider(code: 'TIGO_TZA', name: 'Tigo Tanzania', phoneFormat: '255XXXXXXXXX'),
      Provider(code: 'HALOTEL_TZA', name: 'Halotel Tanzania', phoneFormat: '255XXXXXXXXX'),
    ],
  ),
  'RWA': const CountryConfig(
    code: 'RWA',
    name: 'Rwanda',
    currency: 'RWF',
    symbol: 'RWF',
    amounts: [5000, 10000, 20000, 50000, 100000],
    impacts: [
      Impact(name: 'Clean Water', amount: 5000, description: 'Provides safe drinking water'),
      Impact(name: 'School Supplies', amount: 20000, description: 'Books & uniforms'),
      Impact(name: 'Healthcare', amount: 50000, description: 'Essential medical kits'),
    ],
    providers: [
      Provider(code: 'MTN_MOMO_RWA', name: 'MTN Rwanda', phoneFormat: '250XXXXXXXXX'),
      Provider(code: 'AIRTEL_RWA', name: 'Airtel Rwanda', phoneFormat: '250XXXXXXXXX'),
    ],
  ),
  'GHA': const CountryConfig(
    code: 'GHA',
    name: 'Ghana',
    currency: 'GHS',
    symbol: 'GH₵',
    amounts: [20, 50, 100, 200, 500],
    impacts: [
      Impact(name: 'Clean Water', amount: 20, description: 'Provides safe drinking water'),
      Impact(name: 'School Supplies', amount: 100, description: 'Books & uniforms'),
      Impact(name: 'Healthcare', amount: 200, description: 'Essential medical kits'),
    ],
    providers: [
      Provider(code: 'MTN_MOMO_GHA', name: 'MTN Ghana', phoneFormat: '233XXXXXXXXX'),
      Provider(code: 'VODAFONE_GHA', name: 'Vodafone Ghana', phoneFormat: '233XXXXXXXXX'),
      Provider(code: 'AIRTELTIGO_GHA', name: 'AirtelTigo Ghana', phoneFormat: '233XXXXXXXXX'),
    ],
  ),
  'NGA': const CountryConfig(
    code: 'NGA',
    name: 'Nigeria',
    currency: 'NGN',
    symbol: '₦',
    amounts: [2000, 5000, 10000, 20000, 50000],
    impacts: [
      Impact(name: 'Clean Water', amount: 2000, description: 'Provides safe drinking water'),
      Impact(name: 'School Supplies', amount: 10000, description: 'Books & uniforms'),
      Impact(name: 'Healthcare', amount: 20000, description: 'Essential medical kits'),
    ],
    providers: [
      Provider(code: 'MTN_MOMO_NGA', name: 'MTN Nigeria', phoneFormat: '234XXXXXXXXX'),
      Provider(code: 'AIRTEL_NGA', name: 'Airtel Nigeria', phoneFormat: '234XXXXXXXXX'),
    ],
  ),
  'ZMB': const CountryConfig(
    code: 'ZMB',
    name: 'Zambia',
    currency: 'ZMW',
    symbol: 'ZMW',
    amounts: [50, 100, 250, 500, 1000],
    impacts: [
      Impact(name: 'Clean Water', amount: 50, description: 'Provides safe drinking water'),
      Impact(name: 'School Supplies', amount: 250, description: 'Books & uniforms'),
      Impact(name: 'Healthcare', amount: 500, description: 'Essential medical kits'),
    ],
    providers: [
      Provider(code: 'MTN_MOMO_ZMB', name: 'MTN Zambia', phoneFormat: '260XXXXXXXXX'),
      Provider(code: 'AIRTEL_OAPI_ZMB', name: 'Airtel Zambia', phoneFormat: '260XXXXXXXXX'),
      Provider(code: 'ZAMTEL_ZMB', name: 'Zamtel', phoneFormat: '260XXXXXXXXX'),
    ],
  ),
  'MWI': const CountryConfig(
    code: 'MWI',
    name: 'Malawi',
    currency: 'MWK',
    symbol: 'MWK',
    amounts: [5000, 10000, 25000, 50000, 100000],
    impacts: [
      Impact(name: 'Clean Water', amount: 5000, description: 'Provides safe drinking water'),
      Impact(name: 'School Supplies', amount: 25000, description: 'Books & uniforms'),
      Impact(name: 'Healthcare', amount: 50000, description: 'Essential medical kits'),
    ],
    providers: [
      Provider(code: 'AIRTEL_MWI', name: 'Airtel Malawi', phoneFormat: '265XXXXXXXXX'),
      Provider(code: 'TNM_MWI', name: 'TNM Malawi', phoneFormat: '265XXXXXXXXX'),
    ],
  ),
  'MOZ': const CountryConfig(
    code: 'MOZ',
    name: 'Mozambique',
    currency: 'MZN',
    symbol: 'MZN',
    amounts: [200, 500, 1000, 2000, 5000],
    impacts: [
      Impact(name: 'Clean Water', amount: 200, description: 'Provides safe drinking water'),
      Impact(name: 'School Supplies', amount: 1000, description: 'Books & uniforms'),
      Impact(name: 'Healthcare', amount: 2000, description: 'Essential medical kits'),
    ],
    providers: [
      Provider(code: 'VODACOM_MOZ', name: 'Vodacom Mozambique', phoneFormat: '258XXXXXXXXX'),
    ],
  ),
  'COD': const CountryConfig(
    code: 'COD',
    name: 'DR Congo',
    currency: 'CDF',
    symbol: 'CDF',
    amounts: [5000, 10000, 25000, 50000, 100000],
    impacts: [
      Impact(name: 'Clean Water', amount: 5000, description: 'Provides safe drinking water'),
      Impact(name: 'School Supplies', amount: 25000, description: 'Books & uniforms'),
      Impact(name: 'Healthcare', amount: 50000, description: 'Essential medical kits'),
    ],
    providers: [
      Provider(code: 'VODACOM_MPESA_COD', name: 'Vodacom M-Pesa DRC', phoneFormat: '243XXXXXXXXX'),
      Provider(code: 'AIRTEL_COD', name: 'Airtel DRC', phoneFormat: '243XXXXXXXXX'),
      Provider(code: 'ORANGE_COD', name: 'Orange DRC', phoneFormat: '243XXXXXXXXX'),
    ],
  ),
  'CMR': const CountryConfig(
    code: 'CMR',
    name: 'Cameroon',
    currency: 'XAF',
    symbol: 'FCFA',
    amounts: [2000, 5000, 10000, 25000, 50000],
    impacts: [
      Impact(name: 'Clean Water', amount: 2000, description: 'Provides safe drinking water'),
      Impact(name: 'School Supplies', amount: 10000, description: 'Books & uniforms'),
      Impact(name: 'Healthcare', amount: 25000, description: 'Essential medical kits'),
    ],
    providers: [
      Provider(code: 'MTN_MOMO_CMR', name: 'MTN Cameroon', phoneFormat: '237XXXXXXXXX'),
      Provider(code: 'ORANGE_CMR', name: 'Orange Cameroon', phoneFormat: '237XXXXXXXXX'),
    ],
  ),
  'CIV': const CountryConfig(
    code: 'CIV',
    name: 'Côte d\'Ivoire',
    currency: 'XOF',
    symbol: 'FCFA',
    amounts: [2000, 5000, 10000, 25000, 50000],
    impacts: [
      Impact(name: 'Clean Water', amount: 2000, description: 'Provides safe drinking water'),
      Impact(name: 'School Supplies', amount: 10000, description: 'Books & uniforms'),
      Impact(name: 'Healthcare', amount: 25000, description: 'Essential medical kits'),
    ],
    providers: [
      Provider(code: 'MTN_MOMO_CIV', name: 'MTN Côte d\'Ivoire', phoneFormat: '225XXXXXXXXX'),
      Provider(code: 'ORANGE_CIV', name: 'Orange Côte d\'Ivoire', phoneFormat: '225XXXXXXXXX'),
    ],
  ),
  'SEN': const CountryConfig(
    code: 'SEN',
    name: 'Senegal',
    currency: 'XOF',
    symbol: 'FCFA',
    amounts: [2000, 5000, 10000, 25000, 50000],
    impacts: [
      Impact(name: 'Clean Water', amount: 2000, description: 'Provides safe drinking water'),
      Impact(name: 'School Supplies', amount: 10000, description: 'Books & uniforms'),
      Impact(name: 'Healthcare', amount: 25000, description: 'Essential medical kits'),
    ],
    providers: [
      Provider(code: 'ORANGE_SEN', name: 'Orange Senegal', phoneFormat: '221XXXXXXXXX'),
      Provider(code: 'FREE_SEN', name: 'Free Senegal', phoneFormat: '221XXXXXXXXX'),
    ],
  ),
  'BEN': const CountryConfig(
    code: 'BEN',
    name: 'Benin',
    currency: 'XOF',
    symbol: 'FCFA',
    amounts: [2000, 5000, 10000, 25000, 50000],
    impacts: [
      Impact(name: 'Clean Water', amount: 2000, description: 'Provides safe drinking water'),
      Impact(name: 'School Supplies', amount: 10000, description: 'Books & uniforms'),
      Impact(name: 'Healthcare', amount: 25000, description: 'Essential medical kits'),
    ],
    providers: [
      Provider(code: 'MTN_MOMO_BEN', name: 'MTN Benin', phoneFormat: '229XXXXXXXXX'),
      Provider(code: 'MOOV_BEN', name: 'Moov Benin', phoneFormat: '229XXXXXXXXX'),
    ],
  ),
  'BFA': const CountryConfig(
    code: 'BFA',
    name: 'Burkina Faso',
    currency: 'XOF',
    symbol: 'FCFA',
    amounts: [2000, 5000, 10000, 25000, 50000],
    impacts: [
      Impact(name: 'Clean Water', amount: 2000, description: 'Provides safe drinking water'),
      Impact(name: 'School Supplies', amount: 10000, description: 'Books & uniforms'),
      Impact(name: 'Healthcare', amount: 25000, description: 'Essential medical kits'),
    ],
    providers: [
      Provider(code: 'ORANGE_BFA', name: 'Orange Burkina Faso', phoneFormat: '226XXXXXXXXX'),
      Provider(code: 'MOOV_BFA', name: 'Moov Burkina Faso', phoneFormat: '226XXXXXXXXX'),
    ],
  ),
  'COG': const CountryConfig(
    code: 'COG',
    name: 'Republic of Congo',
    currency: 'XAF',
    symbol: 'FCFA',
    amounts: [2000, 5000, 10000, 25000, 50000],
    impacts: [
      Impact(name: 'Clean Water', amount: 2000, description: 'Provides safe drinking water'),
      Impact(name: 'School Supplies', amount: 10000, description: 'Books & uniforms'),
      Impact(name: 'Healthcare', amount: 25000, description: 'Essential medical kits'),
    ],
    providers: [
      Provider(code: 'AIRTEL_COG', name: 'Airtel Congo', phoneFormat: '242XXXXXXXXX'),
      Provider(code: 'MTN_MOMO_COG', name: 'MTN Congo', phoneFormat: '242XXXXXXXXX'),
    ],
  ),
  'GAB': const CountryConfig(
    code: 'GAB',
    name: 'Gabon',
    currency: 'XAF',
    symbol: 'FCFA',
    amounts: [2000, 5000, 10000, 25000, 50000],
    impacts: [
      Impact(name: 'Clean Water', amount: 2000, description: 'Provides safe drinking water'),
      Impact(name: 'School Supplies', amount: 10000, description: 'Books & uniforms'),
      Impact(name: 'Healthcare', amount: 25000, description: 'Essential medical kits'),
    ],
    providers: [
      Provider(code: 'AIRTEL_GAB', name: 'Airtel Gabon', phoneFormat: '241XXXXXXXXX'),
    ],
  ),
  'SLE': const CountryConfig(
    code: 'SLE',
    name: 'Sierra Leone',
    currency: 'SLE',
    symbol: 'SLE',
    amounts: [50, 100, 250, 500, 1000],
    impacts: [
      Impact(name: 'Clean Water', amount: 50, description: 'Provides safe drinking water'),
      Impact(name: 'School Supplies', amount: 250, description: 'Books & uniforms'),
      Impact(name: 'Healthcare', amount: 500, description: 'Essential medical kits'),
    ],
    providers: [
      Provider(code: 'ORANGE_SLE', name: 'Orange Sierra Leone', phoneFormat: '232XXXXXXXXX'),
    ],
  ),
  'INTL': const CountryConfig(
    code: 'INTL',
    name: 'International (Card)',
    currency: 'USD',
    symbol: '$',
    amounts: [10, 25, 50, 100, 250],
    impacts: [
      Impact(name: 'Clean Water', amount: 10, description: 'Provides safe drinking water'),
      Impact(name: 'School Supplies', amount: 50, description: 'Books & uniforms'),
      Impact(name: 'Healthcare', amount: 100, description: 'Essential medical kits'),
    ],
    providers: [],
  ),
};

List<String> getCountryCodes() {
  return countryConfigs.keys.toList()..sort();
}

String getCountryDisplayName(String code) {
  final config = countryConfigs[code];
  if (config != null) {
    return '${getFlagEmoji(code)} ${config.name}';
  }
  return code;
}

String getFlagEmoji(String countryCode) {
  switch (countryCode) {
    case 'UGA': return '🇺🇬';
    case 'KEN': return '🇰🇪';
    case 'TZA': return '🇹🇿';
    case 'RWA': return '🇷🇼';
    case 'GHA': return '🇬🇭';
    case 'NGA': return '🇳🇬';
    case 'ZMB': return '🇿🇲';
    case 'MWI': return '🇲🇼';
    case 'MOZ': return '🇲🇿';
    case 'COD': return '🇨🇩';
    case 'CMR': return '🇨🇲';
    case 'CIV': return '🇨🇮';
    case 'SEN': return '🇸🇳';
    case 'BEN': return '🇧🇯';
    case 'BFA': return '🇧🇫';
    case 'COG': return '🇨🇬';
    case 'GAB': return '🇬🇦';
    case 'SLE': return '🇸🇱';
    case 'INTL': return '🌍';
    default: return '🏳️';
  }
}