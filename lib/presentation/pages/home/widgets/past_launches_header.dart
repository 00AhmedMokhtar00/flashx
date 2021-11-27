part of 'widgets.dart';

class PastLaunchesHeader extends StatelessWidget {
  const PastLaunchesHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Text(
              'Past Launches',
              style: TextStyle(color: Colors.white, fontSize: 24),
            ),
            Text(
              'Filter',
              style: TextStyle(
                  color: Colors.pinkAccent, fontSize: 13),
            )
          ],
        ),
      ),
    );
  }
}
