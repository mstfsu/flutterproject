class post {
	int userId;
	int id;
	String title;
	String body;

	post.fromJson(Map<String, dynamic> json)
			:	userId = json['userId'],
	id = json['id'],
	title = json['title'],
	body = json['body'];

	Map<String, dynamic> toJson() => {
				'userId': this.userId,
				'id': this.id,
				'title': this.title,
				'body': this.body,
			};
}
