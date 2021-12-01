import 'package:flutter/material.dart';

import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../widgets/progress_indicators/application_progress_indicator.dart';
import '../../../../application/blocs.dart';
import '../../../helpers/asset_paths.dart';
import '../../../helpers/screen_size.dart';
import '../../../../domain/models.dart';
import '../../../theme/themes.dart';

part 'launch_details_page.dart';
part 'video_section.dart';