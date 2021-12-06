import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../application/past_launches/past_launches_cubit.dart';
import '../../../../infrastructure/local/manager.dart';
import '../../../theme/styles.dart';
import '../../../theme/themes.dart';

class AnimatedFab extends StatefulWidget {
  const AnimatedFab({Key? key}) : super(key: key);
  @override
  _AnimatedFabState createState() => _AnimatedFabState();
}

class _AnimatedFabState extends State<AnimatedFab> with SingleTickerProviderStateMixin{
  StreamSubscription<PastLaunchesState>? _streamSubscription;

  int fromDate = 0, toDate = 0;
  String fromDateString = "", toDateString = "";
  bool centered = false;
  final double expandedWidth = 230.0;
  final double hiddenWidth = 22.0;
  late AnimationController _animationController;
  late Animation<Color?> _colorAnimation;

  @override
  void initState() {
    super.initState();
    _streamSubscription = context.read<PastLaunchesCubit>().stream.listen((state) {
      if(state.filteredPastLaunches == null){
        close();
      }
    });
    _animationController = AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: 300)
    );
    _colorAnimation = ColorTween(
        begin: Colors.black87,
        end: Colors.black
    ).animate(_animationController);
  }

  @override
  void dispose() {
    _animationController.dispose();
    _streamSubscription?.cancel();
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
      fromDateString = "";
      toDateString = "";
      // PastLaunchesState pastLaunchesState = context.read<PastLaunchesCubit>().state;
      // if(pastLaunchesState is PastLaunchesFilteredSuccessfully){
      //   context.read<PastLaunchesCubit>().callPastLaunches();
      // }
      context.read<PastLaunchesCubit>().closeFilter();
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
                alignment: fromDateString.isNotEmpty?Alignment.centerLeft:Alignment.center,

                decoration: BoxDecoration(
                  color: ApplicationTheme.currentTheme.primaryColor,
                  border: Border.all(color: ApplicationTheme.currentTheme.colorScheme.secondary),
                  borderRadius: ApplicationStyles.leftBorderRadius
                ),
                child: Text(
                  fromDateString.isEmpty?"From":fromDateString,
                  style: TextStyle(
                    fontSize: fromDateString.isEmpty?16.0:12.0,
                    color: ApplicationTheme.currentTheme.colorScheme.secondary,
                    fontWeight: FontWeight.bold
                  ),
                )
              ),
            ),
          ),

          Expanded(
            child: InkWell(
              onTap: fromDateString.isNotEmpty?onToFilterButtonTapped:null,
              child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  height: double.infinity,
                  alignment: toDateString.isNotEmpty?Alignment.centerRight:Alignment.center,

                  decoration: BoxDecoration(
                      color: ApplicationTheme.currentTheme.primaryColor,
                      border: ApplicationStyles.outlineBorder,
                      borderRadius: ApplicationStyles.rightBorderRadius
                  ),
                  child: Text(
                    toDateString.isEmpty?"To":toDateString,
                    style: TextStyle(
                        fontSize: toDateString.isEmpty?16.0:12.0,
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
        fromDateString = DateFormat("dd MMM, yyyy").format(picked);
        toDateString = "";
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
      toDateString = DateFormat("dd MMM, yyyy").format(picked);

      PastLaunchesState pastLaunchesState = context.read<PastLaunchesCubit>().state;
      if(pastLaunchesState.pastLaunches != null){
        context.read<PastLaunchesCubit>().filterPastLaunchesByTwoDates(fromDate, toDate);
      }

      setState(() {});
    }
  }
}
