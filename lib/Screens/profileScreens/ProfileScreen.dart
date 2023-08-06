import 'package:digestdraft/Screens/profileScreens/profile_list_item.dart';
import 'package:flutter/material.dart';
import 'package:digestdraft/Screens/profileScreens/constants.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({
    Key? key,
  }) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kAppPrimaryColor,
      body: const Stack(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(25),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AppBarButton(
                        icon: Icons.arrow_back,
                      ),
                      // SvgPicture.asset("assets/icons/menu.svg"),
                    ],
                  ),
                ),
                AvatarImage(),
                SizedBox(
                  height: 30,
                ),
                SizedBox(height: 30),
                Text(
                  'chromicle',
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w700,
                      fontFamily: "Poppins"),
                ),
                Text(
                  '@amFOSS',
                  style: TextStyle(fontWeight: FontWeight.w300),
                ),
                SizedBox(height: 15),
                Text(
                  'Mobile App Developer and Open source enthusiastic',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20, fontFamily: "Poppins"),
                ),
                ProfileListItems(),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class AppBarButton extends StatelessWidget {
  final IconData icon;

  const AppBarButton({super.key, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 55,
      height: 55,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: kAppPrimaryColor,
          boxShadow: [
            BoxShadow(
              color: kLightBlack,
              offset: const Offset(1, 1),
              blurRadius: 10,
            ),
            BoxShadow(
              color: kWhite,
              offset: const Offset(-1, -1),
              blurRadius: 10,
            ),
          ]),
      child: Icon(
        icon,
        color: fCL,
      ),
    );
  }
}

class AvatarImage extends StatelessWidget {
  const AvatarImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 150,
      padding: const EdgeInsets.all(8),
      decoration: avatarDecoration,
      child: Container(
        decoration: avatarDecoration,
        padding: const EdgeInsets.all(3),
        child: Container(
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              image: AssetImage('assets/images/rdj.jpg'),
            ),
          ),
        ),
      ),
    );
  }
}

// class SocialIcons extends StatelessWidget {
//   const SocialIcons({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: <Widget>[
//         SocialIcon(
//           color: const Color(0xFF102397),
//           iconData: facebook,
//           onPressed: () {},
//         ),
//         SocialIcon(
//           color: const Color(0xFFff4f38),
//           iconData: googlePlus,
//           onPressed: () {},
//         ),
//         SocialIcon(
//           color: const Color(0xFF38A1F3),
//           iconData: twitter,
//           onPressed: () {},
//         ),
//         SocialIcon(
//           color: const Color(0xFF2867B2),
//           iconData: linkedin,
//           onPressed: () {},
//         )
//       ],
//     );
//   }
// }

class SocialIcon extends StatelessWidget {
  const SocialIcon(
      {super.key,
      required this.color,
      required this.iconData,
      required this.onPressed});
  final Color color;
  final IconData iconData;
  final Function onPressed;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0),
      child: Container(
        width: 45.0,
        height: 45.0,
        decoration: BoxDecoration(shape: BoxShape.circle, color: color),
        child: RawMaterialButton(
          shape: const CircleBorder(),
          onPressed: () => onPressed,
          child: Icon(iconData, color: Colors.white),
        ),
      ),
    );
  }
}

class ProfileListItems extends StatelessWidget {
  const ProfileListItems({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        children: const <Widget>[
          ProfileListItem(
            icon: Icons.verified_user_outlined,
            text: 'Privacy',
          ),
          ProfileListItem(
            icon: Icons.history,
            text: 'Purchase History',
          ),
          ProfileListItem(
            icon: Icons.question_mark,
            text: 'Help & Support',
          ),
          ProfileListItem(
            icon: Icons.settings,
            text: 'Settings',
          ),
          ProfileListItem(
            icon: Icons.share,
            text: 'Invite a Friend',
          ),
          ProfileListItem(
            icon: Icons.logout,
            text: 'Logout',
            hasNavigation: false,
          ),
        ],
      ),
    );
  }
}
