import 'package:flashx/infrastructure/local/manager.dart';
import 'package:flashx/presentation/theme/colors.dart';
import 'package:flashx/presentation/theme/styles.dart';
import 'package:flashx/presentation/theme/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../application/past_launches/past_launches_bloc.dart';
import 'package:intl/intl.dart';

class AnimatedFab extends StatefulWidget {
  const AnimatedFab({Key? key}) : super(key: key);

  @override
  _AnimatedFabState createState() => _AnimatedFabState();
}

class _AnimatedFabState extends State<AnimatedFab> with SingleTickerProviderStateMixin{
  int fromDate = 0, toDate = 0;
  String fd1 = "", fd2 = "";
  bool centered = false;
  final double expandedWidth = 230.0;
  final double hiddenWidth = 22.0;
  late AnimationController _animationController;
  late Animation<Color?> _colorAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: 500)
    );
    _colorAnimation = ColorTween(
        begin: Colors.black87,
        end: Colors.black
    ).animate(_animationController);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: expandedWidth,
        child: AnimatedBuilder(
            animation: _animationController,
            builder: (BuildContext context, Widget? child) {
              return Stack(
                alignment: centered? Alignment.center : Alignment.centerRight,
                children: <Widget>[
                  _buildExpandedBackground(),
                  _buildFabCore(),
                ],
              );
            }));
  }

  Widget _buildFabCore() {
    double scaleFactor = 2 * (_animationController.value - 0.5).abs();
    return Container(
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
          border: centered?ApplicationStyles.outlineBorder:null,
          shape: BoxShape.circle,
        color: _colorAnimation.value
      ),
      child: InkWell(
        onTap: _onFabTap,
        child: Transform(
          alignment: Alignment.center,
          transform: Matrix4.identity()..scale(1.0, scaleFactor),
          child: Icon(
            _animationController.value > 0.5 ? Icons.close : Icons.filter_list,
            color: ApplicationTheme.currentTheme.colorScheme.secondary,
            size: 28.0,
          ),
        ),
      ),
    );
  }

  open() {
    if (_animationController.isDismissed) {
      _animationController.forward();
      setState(() {
        centered = true;
      });
    }
  }

  close() {
    if (_animationController.isCompleted) {
      _animationController.reverse();
      centered = false;
      fd1 = "";
      fd2 = "";
      PastLaunchesState pastLaunchesState = BlocProvider.of<PastLaunchesBloc>(context).state;
      if(pastLaunchesState is PastLaunchesFilteredSuccessfully){
        BlocProvider.of<PastLaunchesBloc>(context).add(PastLaunchesCalled());
      }
      setState(() {});
    }
  }

  _onFabTap() {
    if (_animationController.isDismissed) {
      open();
    } else {
      close();
    }
  }

  Widget _buildExpandedBackground() {
    double size = hiddenWidth + (expandedWidth - hiddenWidth) * _animationController.value;
    return Container(
      height: 40.0,
      width: size,
      decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          color: ApplicationTheme.currentTheme.primaryColor,
          borderRadius: ApplicationStyles.borderRadius
      ),
      child: size > expandedWidth - hiddenWidth?
      Row(
        children: [
          Expanded(
            child: InkWell(
              onTap: onFromFilterButtonTapped,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                height: double.infinity,
                alignment: fd1.isNotEmpty?Alignment.centerLeft:Alignment.center,

                decoration: BoxDecoration(
                  color: Colors.black,
                  border: Border.all(color: Colors.white60),
                  borderRadius: ApplicationStyles.leftBorderRadius
                ),
                child: Text(
                  fd1.isEmpty?"From":fd1,
                  style: TextStyle(
                    fontSize: fd1.isEmpty?16.0:12.0,
                    color: Colors.white,
                    fontWeight: FontWeight.bold
                  ),
                )
              ),
            ),
          ),

          Expanded(
            child: InkWell(
              onTap: fd1.isNotEmpty?onToFilterButtonTapped:null,
              child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  height: double.infinity,
                  alignment: fd2.isNotEmpty?Alignment.centerRight:Alignment.center,

                  decoration: BoxDecoration(
                      color: ApplicationTheme.currentTheme.primaryColor,
                      border: ApplicationStyles.outlineBorder,
                      borderRadius: ApplicationStyles.rightBorderRadius
                  ),
                  child: Text(
                    fd2.isEmpty?"To":fd2,
                    style: TextStyle(
                        fontSize: fd2.isEmpty?16.0:12.0,
                        color: ApplicationTheme.currentTheme.colorScheme.secondary,
                        fontWeight: FontWeight.bold
                    ),
                  )
              ),
            ),
          ),
        ],
      ):null,
    );
  }

  onFromFilterButtonTapped()async{
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2006),
        lastDate: DateTime.now()
    );

    if (picked != null) {
      setState(() {
        fromDate = picked.millisecondsSinceEpoch;
        fd1 = DateFormat("dd MMM, yyyy").format(picked);
        fd2 = "";
        toDate = 0;
      });
    }
  }

  onToFilterButtonTapped()async{
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.fromMillisecondsSinceEpoch(fromDate),
        lastDate: DateTime.now()
    );

    if (picked != null) {
      toDate = picked.millisecondsSinceEpoch;
      fd2 = DateFormat("dd MMM, yyyy").format(picked);

      PastLaunchesState pastLaunchesState = BlocProvider.of<PastLaunchesBloc>(context).state;
      if(pastLaunchesState is PastLaunchesLoadedSuccessfully){
        BlocProvider.of<PastLaunchesBloc>(context).add(PastLaunchesFilteredByTwoDates(fromDate, toDate, pastLaunchesState.pastLaunches));
      }else if(pastLaunchesState is PastLaunchesFilteredSuccessfully){
        BlocProvider.of<PastLaunchesBloc>(context).add(PastLaunchesFilteredByTwoDates(fromDate, toDate, LocalDatabaseManager.pastLaunches));
      }

      setState(() {});
    }
  }
}
