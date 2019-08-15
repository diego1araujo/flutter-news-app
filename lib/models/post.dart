class Post {
    String title, description, url, image, date;

    Post({this.title, this.description, this.url, this.image, this.date});

    Post.fromJson(Map<String, dynamic> json) {
        title = json['title'];
        description = json['description'];
        url = json['url'];
        image = json['urlToImage'];
        date = json['publishedAt'];
    }
}
