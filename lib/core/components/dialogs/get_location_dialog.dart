import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:matchangoo/core/appetizers/global_models/location.dart';
import 'package:matchangoo/core/components/buttons/animated_button.dart';
import 'package:matchangoo/core/components/buttons/animator_button.dart';
import 'package:matchangoo/core/components/buttons/small_animated_icon.dart';
import 'package:matchangoo/core/constants/asset_paths.dart';
import 'package:matchangoo/core/constants/design_constants.dart';
import 'package:matchangoo/core/init/get_them_all/get_it_container.dart';
import 'package:matchangoo/core/result_error/errors/custom_error.dart';
import 'package:matchangoo/core/result_error/result_freezed/result.dart';
import 'package:matchangoo/core/structure/utils/extensions/context_extension.dart';
import 'package:matchangoo/core/structure/utils/extensions/sizedBox_extension.dart';
import 'package:matchangoo/core/ui/theme/palette.dart';
import 'package:matchangoo/features/Identification/domain/usecases/get_location.dart';
import 'package:matchangoo/features/Identification/presentation/widgets/activatable_button.dart';

class GetLocationDialog extends Dialog {
  final GetLocation getLocationHelper = sl.get<GetLocation>();
  final BuildContext context;
  GetLocationDialog({required this.context})
      : super(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(DesignConstant.shared.borderRadiusExtreme)),
            elevation: 10,
            child: locationDialogChild(context),
            insetPadding: const EdgeInsets.all(20));
}

Stack locationDialogChild(BuildContext context) {
  return Stack(
    alignment: Alignment.center,
    children: [
      Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(0)),
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: context.limitedheightUnit * 4, horizontal: context.limitedwidthUnit * 2.5),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            locationTitle(context),
            SizedBox().heightSpacer(context, 2),
            explanation(),
            SizedBox().heightSpacer(context, 2),
            locationImage(),
            SizedBox().heightSpacer(context, 2),
            enableLocationButton(context)
          ],
        ),
      ),
      Positioned(right: 13, top: 13, child: xCloseButton(context)),
    ],
  );
}

Container enableLocationButton(BuildContext context) {
  return Container(
    margin: EdgeInsets.symmetric(horizontal: context.limitedwidthUnit * 2),
    child: AnimatedButton(
      title: 'Enable your location',
      onPressed: () async {
        final GetLocation getLocation = sl.get<GetLocation>();
        Result<Location> locationResult = await getLocation();
        locationResult.when(success: (Location location) {
          print(location.lat);
          print(location.long);
        }, error: (CustomError err) {
          print('error');
        });
      },
      shadowColor: Palette.enableDialogBlue,
      buttonColor: Palette.enableDialogBlue,
    ),
  );
}

Image locationImage() {
  return Image.asset(
    AssetPaths.shared.getlocation,
    scale: 2.131,
  );
}

Text locationTitle(BuildContext context) {
  return Text(
    'Enable your location',
    style: Theme.of(context).textTheme.headline6?.copyWith(fontSize: 18, fontWeight: FontWeight.bold),
  );
}

Text explanation() => Text('Enable your location to let us match you within your area.', textAlign: TextAlign.center);
