import 'package:flutter/material.dart';

class PostFormResult {
  const PostFormResult({
    required this.userId,
    required this.title,
    required this.body,
    required this.tags,
  });

  final int userId;
  final String title;
  final String body;
  final List<String> tags;
}

class PostFormDialog extends StatefulWidget {
  const PostFormDialog({
    this.initialUserId = 1,
    this.initialTitle = '',
    this.initialBody = '',
    this.initialTags = const <String>[],
    this.isEdit = false,
    super.key,
  });

  final int initialUserId;
  final String initialTitle;
  final String initialBody;
  final List<String> initialTags;
  final bool isEdit;

  @override
  State<PostFormDialog> createState() => _PostFormDialogState();
}

class _PostFormDialogState extends State<PostFormDialog> {
  late final TextEditingController _userIdController;
  late final TextEditingController _titleController;
  late final TextEditingController _bodyController;
  late final TextEditingController _tagsController;

  @override
  void initState() {
    super.initState();
    _userIdController = TextEditingController(text: '${widget.initialUserId}');
    _titleController = TextEditingController(text: widget.initialTitle);
    _bodyController = TextEditingController(text: widget.initialBody);
    _tagsController = TextEditingController(
      text: widget.initialTags.join(', '),
    );
  }

  @override
  void dispose() {
    _userIdController.dispose();
    _titleController.dispose();
    _bodyController.dispose();
    _tagsController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(widget.isEdit ? '게시글 수정' : '게시글 생성'),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: _userIdController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'userId'),
              enabled: !widget.isEdit,
            ),
            const SizedBox(height: 12),
            TextField(
              controller: _titleController,
              decoration: const InputDecoration(labelText: '제목'),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: _bodyController,
              minLines: 4,
              maxLines: 6,
              decoration: const InputDecoration(labelText: '본문'),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: _tagsController,
              decoration: const InputDecoration(
                labelText: '태그',
                hintText: 'news, update',
              ),
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('취소'),
        ),
        FilledButton(
          onPressed: () {
            final title = _titleController.text.trim();
            final body = _bodyController.text.trim();
            final userId = int.tryParse(_userIdController.text.trim()) ?? 1;
            final tags = _tagsController.text
                .split(',')
                .map((item) => item.trim())
                .where((item) => item.isNotEmpty)
                .toList();

            if (title.isEmpty || body.isEmpty) {
              return;
            }

            Navigator.of(context).pop(
              PostFormResult(
                userId: userId,
                title: title,
                body: body,
                tags: tags,
              ),
            );
          },
          child: Text(widget.isEdit ? '수정' : '생성'),
        ),
      ],
    );
  }
}
