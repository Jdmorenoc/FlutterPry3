import 'package:flutter/material.dart';
import 'package:newpry/model/dbz_model.dart';
import 'package:newpry/service/dbz_service.dart';

class DbzScreen extends StatefulWidget {
  const new({super.key});

  @override
  State<DbzScreen> createState() => _DbzScreenState();
}

class _DbzScreenState extends State<DbzScreen> {
  List<DbzModel> dbzList = [];
  int page = 1;
  final ScrollController _scroll = ScrollController();

  Future<void> getData() async {
    try {
      final dbzService = DbzService();
      final response = await dbzService.getDbz(1);
      setState(() {
        dbzList = response;
        page++;
      });
    } catch (e) {
      debugPrint("error  $e");
    }
  }

  @override
  void initState() {
    super.initState();
    getData();
    _scroll.addListener(() {
      if (_scroll.position.pixels >= _scroll.position.maxScrollExtent) {
        getData();
      }
    });
  }

  @override
  void dispose() {
    _scroll.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("DBZ")),
      body: ListView.builder(
        controller: _scroll,
        itemCount: dbzList.length,
        itemBuilder: (context, index) {
          final item = dbzList[index];
          return ListTile(
            title: Text(item.name),
            subtitle: Text(
              item.name,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            leading: Image.network(
              item.ki,
              width: 50,
              height: 50,
              fit: BoxFit.cover,
            ),
          );
        },
      ),
    );
  }
}
