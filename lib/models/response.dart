class Helo {
  final String reference;

  final String status;
  final String expires;

  Helo({this.reference, this.status, this.expires});

  factory Helo.fromJson(Map<String, dynamic> json) {
    return Helo(
      reference: json['reference'],
      status: json['status'],
      expires: json['expires'],
    );
  }
}
