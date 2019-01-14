class Article {
    String title, description, url, image, date;

    Article({this.title, this.description, this.url, this.image, this.date});

    factory Article.fromJson(Map<String, dynamic> json) {
        return Article(
            title: json['title'],
            description: json['description'],
            url: json['url'],
            image: json['urlToImage'],
            date: json['publishedAt'],
        );
    }
}
