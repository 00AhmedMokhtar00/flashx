part of 'widgets.dart';

class PastLaunchesHeader extends StatelessWidget implements PreferredSizeWidget{
  const PastLaunchesHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15.0),
      color: ApplicationTheme.currentTheme.primaryColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          Text(
            'Past Launches',
            style: TextStyle(color: Colors.white, fontSize: 28),
          ),
          AnimatedFab()
          // Text(
          //   'Filter',
          //   style: TextStyle(
          //       color: Colors.pinkAccent, fontSize: 22),
          // )
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60.0);
}
