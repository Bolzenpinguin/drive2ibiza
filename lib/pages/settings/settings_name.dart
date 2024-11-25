import 'package:flutter/material.dart';
import '../../utils/styleguide.dart';
import '../../utils/user_prefs.dart';

class NameSettings extends StatefulWidget {
  const NameSettings({super.key});

  @override
  _NameSettingsState createState() => _NameSettingsState();
}

class _NameSettingsState extends State<NameSettings> {
  final TextEditingController nameController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadUserName();
  }

  Future<void> _loadUserName() async {
    String? savedName = await UserPrefs.getUserName();
    if (savedName != null) {
      setState(() {
        nameController.text = savedName;
      });
    }
  }

  Future<void> _saveName() async {
    String name = nameController.text;
    await UserPrefs.saveUserName(name);

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Name saved successfully')),
    );

    Navigator.pop(context, true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Change your Name'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Container(
              margin: const EdgeInsets.all(marginSmall),
              padding: const EdgeInsets.all(paddingSmall),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(borderRadiusMedium),
                boxShadow: [
                  BoxShadow(
                    color: shadowColor,
                    blurRadius: 10.0, // Shadow blur radius
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Here you can change your name.\n'
                        'Your current Name is:',
                    style: TextStyle(fontSize: 16, color: fontColor),
                  ),
                  FutureBuilder<String?>(
                    future: UserPrefs.getUserName(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return CircularProgressIndicator();
                      }
                      if (snapshot.hasError) {
                        return Text("Error loading Name");
                      }
                      if (!snapshot.hasData || snapshot.data == null) {
                        return Text("-");
                      }
                      return Text('${snapshot.data}');
                    },
                  ),
                  const SizedBox(height: 10),
                  TextField(
                    controller: nameController,
                    decoration: InputDecoration(
                      hintText: 'New Name',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: _saveName,
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          vertical: paddingNormal, horizontal: paddingSmall),
                      foregroundColor: btnFontColor,
                      backgroundColor: btnBackgroundColor,
                    ),
                    child: const Text('Save new Name'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    nameController.dispose();
    super.dispose();
  }
}