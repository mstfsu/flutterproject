class bean {
	int userId;
	int id;
	String title;
	bool completed;

	bean.fromJson(Map<String, dynamic> json)
			:	userId = json['userId'],
	id = json['id'],
	title = json['title'],
	completed = json['completed'];

	Map<String, dynamic> toJson() => {
				'userId': this.userId,
				'id': this.id,
				'title': this.title,
				'completed': this.completed,
			};
}
