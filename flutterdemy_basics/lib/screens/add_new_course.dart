import 'package:flutter/material.dart';
import 'package:flutterdemy_basics/models/course_model.dart';
import 'package:flutterdemy_basics/models/courselist_changenotifier_mode.dart';
import 'package:provider/provider.dart';

class AddNewCourse extends StatefulWidget {
  const AddNewCourse({super.key});

  @override
  State<AddNewCourse> createState() => _AddNewCourseState();
}

class _AddNewCourseState extends State<AddNewCourse> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String? _title;
  String? _subtitle;
  String? _imageUrl;
  String? _description;
  String? _language;
  DateTime? _lastUpdated;
  String? _subTitles;
  String? _trainer;

  int _id = 0;
  int? _likes;
  int? _rating;

  List<String> _subtitlesList = [];

  Widget _buildIdField() {
    return TextFormField(
      decoration: const InputDecoration(
        labelText: "Course Id",
        border: OutlineInputBorder(),
      ),
      keyboardType: TextInputType.number,
      onSaved: (value) {
        if (value != null && value.isNotEmpty) {
          _id = int.parse(value);
        }
      },
    );
  }

  Widget _buildTitleField() {
    return TextFormField(
      decoration: const InputDecoration(
        labelText: "Course Title",
        border: OutlineInputBorder(),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Please enter a value.";
        }
        return null;
      },
      onSaved: (value) {
        if (value != null && value.isNotEmpty) {
          _title = (value);
        }
      },
    );
  }

  Widget _buildSubtitleField() {
    return TextFormField(
      decoration: const InputDecoration(
        labelText: 'Subtitle',
        border: OutlineInputBorder(),
      ),
      onSaved: (value) {
        _subtitle = value;
      },
    );
  }

  Widget _buildLikesField() {
    return TextFormField(
      decoration: const InputDecoration(
        labelText: 'Likes',
        border: OutlineInputBorder(),
      ),
      keyboardType: TextInputType.number,
      initialValue: '0',
      onSaved: (value) {
        _likes = int.tryParse(value ?? '0') ?? 0;
      },
    );
  }

  Widget _buildImageUrlField() {
    return TextFormField(
      decoration: const InputDecoration(
        labelText: 'Image URL',
        border: OutlineInputBorder(),
      ),
      onSaved: (value) {
        _imageUrl = value;
      },
    );
  }

  Widget _buildDescriptionField() {
    return TextFormField(
      decoration: const InputDecoration(
        labelText: 'Description',
        border: OutlineInputBorder(),
      ),
      maxLines: 4,
      onSaved: (value) {
        _description = value;
      },
    );
  }

  Widget _buildRatingField() {
    return TextFormField(
      decoration: const InputDecoration(
        labelText: 'Rating',
        border: OutlineInputBorder(),
      ),
      keyboardType: TextInputType.number,
      onSaved: (value) {
        if (value != null && value.isNotEmpty) {
          _rating = int.tryParse(value);
        }
      },
    );
  }

  Widget _buildLanguageField() {
    return TextFormField(
      decoration: const InputDecoration(
        labelText: 'Language',
        border: OutlineInputBorder(),
      ),
      onSaved: (value) {
        _language = value;
      },
    );
  }

  Widget _buildSubtitlesField() {
    return TextFormField(
      decoration: const InputDecoration(
        labelText: 'Subtitles (comma separated)',
        border: OutlineInputBorder(),
      ),
      onSaved: (value) {
        _subTitles = value;
        _subtitlesList = value!
            .split(',')
            .map((subtitle) => subtitle.trim())
            .where((subtitle) => subtitle.isNotEmpty)
            .toList();
      },
    );
  }

  Widget _buildLastUpdatedField() {
    return TextFormField(
      decoration: const InputDecoration(
        labelText: 'Last Updated (yyyy-mm-dd)',
        border: OutlineInputBorder(),
      ),
      onSaved: (value) {
        if (value != null && value.isNotEmpty) {
          _lastUpdated = DateTime.tryParse(value);
        }
      },
    );
  }

  void _saveCourse() {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    _formKey.currentState!.save();

    final newCourse = CourseModel(
      _id,
      _title,
      _subtitle,
      _likes,
      _imageUrl,
      _description,
      _rating,
      _lastUpdated,
      _language,
      _subtitlesList,
      _trainer,
    );

    Provider.of<CourseListNotifier>(
      context,
      listen: false,
    ).addnewCourse(newCourse);

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Course added successfully !")),
    );

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Add New Course",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.deepPurpleAccent,
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              const SizedBox(height: 16),

              _buildIdField(),
              const SizedBox(height: 16),
              _buildTitleField(),
              const SizedBox(height: 16),
              _buildSubtitleField(),
              const SizedBox(height: 16),
              _buildImageUrlField(),
              const SizedBox(height: 16),
              _buildLikesField(),
              const SizedBox(height: 16),
              _buildLanguageField(),
              const SizedBox(height: 16),
              _buildRatingField(),
              const SizedBox(height: 16),
              _buildDescriptionField(),
              const SizedBox(height: 16),
              _buildLastUpdatedField(),
              const SizedBox(height: 16),
              _buildSubtitlesField(),
              const SizedBox(height: 16),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    _saveCourse();
                  },
                  child: const Text("Save Course"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
