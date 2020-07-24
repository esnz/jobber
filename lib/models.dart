class JobItem {
  final String id;
  final String type;
  final String url;
  final String company;
  final String location;
  final String title;
  final String description;
  final String howToApply;
  final String companyLogo;

  JobItem(this.id, this.type, this.url, this.company, this.location, this.title, this.description, this.howToApply, this.companyLogo);

  factory JobItem.fromJson(Map<String, dynamic> json) {
    return JobItem(
      json['id'],
      json['type'].toString(),
      json['url'].toString(),
      json['company'].toString(),
      json['location'].toString(),
      json['title'].toString(),
      json['description'].toString(),
      json['how_to_apply'].toString(),
      json['company_logo'].toString(),
    );
  }
}