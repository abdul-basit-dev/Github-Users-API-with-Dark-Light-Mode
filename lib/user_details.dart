import 'package:flutter/material.dart';

class UserDetails extends StatefulWidget {
  final String login;
  final bool isAdmin;
  final String avatarUrl;
  final String url;

  const UserDetails({
    Key? key,
    required this.login,
    required this.isAdmin,
    required this.avatarUrl,
    required this.url,
  }) : super(key: key);

  @override
  State<UserDetails> createState() => _UserDetailsState();
}

class _UserDetailsState extends State<UserDetails> {
  bool isDark = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: (isDark ? Colors.black : Colors.white),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 36, 24, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  IconButton(
                    icon: Icon(
                      Icons.arrow_back,
                      color: (isDark ? Colors.white : Colors.black),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  IconButton(
                    icon: isDark
                        ? Icon(
                            Icons.light_mode_outlined,
                            color: (isDark ? Colors.white : Colors.black),
                          )
                        : Icon(
                            Icons.dark_mode_outlined,
                            color: (isDark ? Colors.white : Colors.black),
                          ),
                    onPressed: () {
                      setState(() {
                        isDark = !isDark;
                      });
                    },
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 12),
              child: CircleAvatar(
                radius: 50.0,
                backgroundColor: Colors.deepPurple,
                child: CircleAvatar(
                  backgroundColor: (isDark ? Colors.black : Colors.white),
                  radius: 48.0,
                  backgroundImage: NetworkImage(widget.avatarUrl),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 8),
              child: Container(
                alignment: Alignment.center,
                child: Text(
                  widget.login,
                  style: TextStyle(
                    fontSize: 18.0,
                    color: (isDark ? Colors.white : Colors.black),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 16),
              child: Container(
                alignment: Alignment.center,
                child: Text(
                  widget.url,
                  style: TextStyle(
                    fontSize: 14.0,
                    color: (isDark ? Colors.white54 : Colors.black54),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 36),
              child: Container(
                alignment: Alignment.center,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    primary: Colors.amber,
                    onPrimary: Colors.deepPurple,
                    elevation: 8.0,
                    shadowColor: Colors.deepPurple,
                    fixedSize: const Size(250.0, 48.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        30.0,
                      ),
                    ),
                  ),
                  child: const Text(
                    'Upgrade to PRO',
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.black87,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 0, 24, 8),
              child: _mCardView(
                "Privacy",
                Icons.privacy_tip_outlined,
                Icons.arrow_forward_ios_outlined,
                isDark,
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 0, 24, 8),
              child: _mCardView(
                "Purchase History",
                Icons.history_outlined,
                Icons.arrow_forward_ios_outlined,
                isDark,
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 0, 24, 8),
              child: _mCardView(
                "Help & Support",
                Icons.help_outline_outlined,
                Icons.arrow_forward_ios_outlined,
                isDark,
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 0, 24, 8),
              child: _mCardView(
                "Settings",
                Icons.settings_outlined,
                Icons.arrow_forward_ios_outlined,
                isDark,
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 0, 24, 8),
              child: _mCardView(
                "Invite a Friend",
                Icons.add_circle_outline_sharp,
                Icons.arrow_forward_ios_outlined,
                isDark,
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 0, 24, 16),
              child: SizedBox(
                width: 350.0,
                height: 64.0,
                child: Card(
                  color: (isDark ? Colors.white12 : Colors.blue[50]),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                      30.0,
                    ),
                  ),
                  child: ListTile(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    minLeadingWidth: 10,
                    title: Text(
                      'Logout',
                      style: TextStyle(
                        fontSize: 16.0,
                        color: (isDark ? Colors.white70 : Colors.black87),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    leading: Icon(
                      Icons.logout,
                      color: (isDark ? Colors.white70 : Colors.black87),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget _mCardView(String itemName, IconData itemLeadingIcon,
    IconData itemTrailingIcon, bool toggleMode) {
  return SizedBox(
    width: 350.0,
    height: 64.0,
    child: Card(
      color: (toggleMode ? Colors.white12 : Colors.blue[50]),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          30.0,
        ),
      ),
      child: ListTile(
        minLeadingWidth: 10,
        title: Text(
          itemName,
          style: TextStyle(
            fontSize: 16.0,
            color: (toggleMode ? Colors.white70 : Colors.black87),
            fontWeight: FontWeight.w500,
          ),
        ),
        leading: Icon(
          itemLeadingIcon,
          color: (toggleMode ? Colors.white70 : Colors.black87),
        ),
        trailing: Icon(
          itemTrailingIcon,
          color: (toggleMode ? Colors.white70 : Colors.black87),
        ),
      ),
    ),
  );
}
