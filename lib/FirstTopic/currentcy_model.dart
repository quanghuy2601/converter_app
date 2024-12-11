class Meta {
  final String lastUpdatedAt;

  Meta({required this.lastUpdatedAt});

  factory Meta.fromJson(Map<String, dynamic> json) {
    return Meta(
      lastUpdatedAt: json['last_updated_at'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'last_updated_at': lastUpdatedAt,
    };
  }
}

class Currency {
  final String code;
  final double value;

  Currency({required this.code, required this.value});

  factory Currency.fromJson(Map<String, dynamic> json) {
    return Currency(
      code: json['code'],
      value: (json['value'] as num).toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'code': code,
      'value': value,
    };
  }
}

class ExchangeRates {
  final Meta meta;
  final Map<String, Currency> data;

  ExchangeRates({required this.meta, required this.data});

  factory ExchangeRates.fromJson(Map<String, dynamic> json) {
    return ExchangeRates(
      meta: Meta.fromJson(json['meta']),
      data: (json['data'] as Map<String, dynamic>).map(
        (key, value) => MapEntry(key, Currency.fromJson(value)),
      ),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'meta': meta.toJson(),
      'data': data.map((key, value) => MapEntry(key, value.toJson())),
    };
  }
}
