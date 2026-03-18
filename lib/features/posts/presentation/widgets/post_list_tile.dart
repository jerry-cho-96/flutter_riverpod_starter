import 'package:flutter/material.dart';

import 'package:riverpod3_starter/features/posts/domain/entities/post.dart';

class PostListTile extends StatelessWidget {
  const PostListTile({required this.post, required this.onTap, super.key});

  final Post post;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        onTap: onTap,
        title: Text(post.title),
        subtitle: Text(post.body, maxLines: 2, overflow: TextOverflow.ellipsis),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [Text('user ${post.userId}'), Text('views ${post.views}')],
        ),
      ),
    );
  }
}
