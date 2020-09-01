import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:personal_website/app_localizations.dart';
import 'package:personal_website/other/markdown_widget.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:ycapp_dart_util/ui/hover_widget.dart';
import 'package:ycapp_dart_util/ui/screen_size.dart';

class ProjectsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(
      desktop: (_) => _Content(),
      mobile: (_) => _Content(
        fontSize: 16,
      ),
    );
  }
}

class _Content extends StatelessWidget {
  final double fontSize;

  const _Content({Key key, this.fontSize = 18}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Text(
          AppLocalizations.of(context).translations['menu']['projects'],
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        Markdown(
          AppLocalizations.of(context).translations['projects']['desc'],
          textStyle: TextStyle(fontSize: fontSize),
        ),
        Container(
          height: 10,
        ),
        _ProjectList(
          titleSize: fontSize,
        ),
      ],
    );
  }
}

class _ProjectList extends StatelessWidget {
  final double titleSize;

  const _ProjectList({Key key, this.titleSize = 18}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List maps = AppLocalizations.of(context).translations['projects']['list'];
    List<_Project> projects = maps.map((map) => _Project.fromMap(map)).toList();
    return ListView.builder(
      padding: EdgeInsets.all(0.0),
      shrinkWrap: true,
      physics: ClampingScrollPhysics(),
      itemBuilder: (context, index) {
        _Project project = projects[index];
        return _ProjectTile(
          project: project,
        );
      },
      itemCount: projects.length,
    );
  }
}

class _ProjectTile extends StatelessWidget {
  final _Project project;
  final double titleSize;

  const _ProjectTile({
    Key key,
    @required this.project,
    this.titleSize = 18,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          if (!project.hasLink)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 4.0),
              child: Text(
                project.title,
                style: Theme.of(context).textTheme.subtitle.copyWith(
                      fontSize: titleSize,
                    ),
              ),
            ),
          if (project.hasLink)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 4.0),
              child: HoverColorWidget(
                value: Colors.white,
                hoverValue: Colors.green[300],
                builder: (context, value) {
                  return GestureDetector(
                    onTap: () {
                      launch(project.link);
                    },
                    child: Text(
                      project.title,
                      style: Theme.of(context).textTheme.subtitle.copyWith(
                            fontSize: titleSize,
                            color: value,
                            decoration: TextDecoration.underline,
                          ),
                    ),
                  );
                },
              ),
            ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 4.0),
            child: Markdown(
              project.desc,
              textStyle: TextStyle(
                fontSize: titleSize - 2,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _Project {
  String title;
  String desc;
  String link;

  _Project.fromMap(Map map) {
    if (map.containsKey('title')) {
      this.title = map['title'];
    }
    if (map.containsKey('desc')) {
      this.desc = map['desc'];
    }
    if (map.containsKey('link')) {
      this.link = map['link'];
    }
  }

  bool get hasLink => this.link != null;
}
