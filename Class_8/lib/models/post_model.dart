import 'package:social_media_app/data/data.dart';
import 'package:social_media_app/models/models.dart';

class Post {
  final User user;
  final String? caption;
  final String? timeAgo;
  final String? imageUrl;
  final int? likes;
  final int? comments;
  final int? shares;

  const Post({
    required this.user,
    required this.caption,
    required this.timeAgo,
    required this.imageUrl,
    required this.likes,
    required this.comments,
    required this.shares,
  });

  factory Post.fromMap(Map<String, dynamic> map) {
    return Post(
      user: currentUser,
      caption: map['caption'],
      timeAgo: map['timeAgo'],
      imageUrl: map['imageUrl'],
      likes: map['likes'],
      comments: map['comments'].length,
      shares: map['shares'],
    );
  }
}
