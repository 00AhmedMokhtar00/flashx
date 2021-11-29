import 'dart:async';
import 'dart:math';
import 'package:flashx/domain/models.dart';
import 'package:flashx/presentation/helpers/helpers.dart';
import 'package:flashx/presentation/pages/home/widgets/filter_button.dart';
import 'package:flashx/presentation/pages/launch_details/launch_details.dart';
import 'package:flashx/presentation/theme/colors.dart';
import 'package:flashx/presentation/theme/fonts.dart';
import 'package:flashx/presentation/theme/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:intl/intl.dart';

import '../../widgets/progress_indicators/application_progress_indicator.dart';
import '../../../helpers/presentation_helpers.dart';
import '../../../../application/blocs.dart';
import '../../../theme/themes.dart';

part 'past_launches_header.dart';
part 'next_launch_widget.dart';
part 'past_launches_list.dart';
part 'past_launch_item.dart';