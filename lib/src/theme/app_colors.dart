import 'package:flutter/material.dart';

class BaseColors {
  static const white = 0xFFFFFFFF;

static const brand100 = 0xFFF0F8EB; // #F0F8EB
static const brand200 = 0xFFD6EBC7; // #D6EBC7
static const brand300 = 0xFFB2DA96; // #B2DA96
static const brand400 = 0xFF89C55F; // #89C55F
static const brand500 = 0xFF74C03E; // #74C03E
static const brand600 = 0xFF68B82F; // #68B82F 
static const brand700 = 0xFF5EA82A; // #5EA82A

  static const red100 = 0xFFFFE1E7;
  static const red200 = 0xFFFFC8D6;
  static const red300 = 0xFFFF9CB3;
  static const red400 = 0xFFFF2E68;
  static const red500 = 0xFFE1024F;
  static const red600 = 0xFFD1003F;
  static const red700 = 0xFFB1003A;
  static const red800 = 0xFF8F002A;
  static const red900 = 0xFF6D001A;
  static const red1000 = 0xFF4B000A;

  static const gray50 = 0xFFF2F5F7;
  static const gray100 = 0xFFE7EAED;
  static const gray200 = 0xFFD8DCDF;
  static const gray300 = 0xFFB9BEC0;
  static const gray400 = 0xFF999999;
  static const gray500 = 0xFF646464;
  static const gray600 = 0xFF3D3D3D;
  static const gray700 = 0xFF202020;

  static const transparent = 0x00000000;
  static const violet100 = 0xFFE5E9FA;
  static const violet200 = 0xFFCFD5F6;
  static const violet300 = 0xFF9398E6;
  static const violet400 = 0xFF7977DB;
  static const violet500 = 0xFF695ECD;
  static const violet600 = 0xFF5A4EB4;

  static const green100 = 0xFFE0F8E9;
  static const green200 = 0xFFC3EFD4;
  static const green300 = 0xFF95E0B3;
  static const green400 = 0xFF5FC98A;
  static const green500 = 0xFF40C174;
  static const green600 = 0xFF30A65F;

  static const yellow100 = 0xFFFFF9EB;
  static const yellow200 = 0xFFFFEEC6;
  static const yellow300 = 0xFFFFDB88;
  static const yellow400 = 0xFFFFCC67;
  static const yellow500 = 0xFFFFBF41;
  static const yellow600 = 0xFFF8B83A;

  static const orange100 = 0xFFFFEDD5;
  static const orange200 = 0xFFFED8AA;
  static const orange300 = 0xFFFEBB73;
  static const orange400 = 0xFFFC943B;
  static const orange500 = 0xFFFA781A;
  static const orange600 = 0xFFEB5A0B;

  static const blue100 = 0xFFDFEAFA;
  static const blue200 = 0xFFC6DAF7;
  static const blue300 = 0xFF9FC2F1;
  static const blue400 = 0xFF71A1E9;
  static const blue500 = 0xFF4A7CE0;
  static const blue600 = 0xFF3B64D5;

  static const gray800 = 0xFF1A1A1A;
  static const gray900 = 0xFF000000;

  static const black = 0xFF000000;
}

class AppColors {
  static const Color white = Color(BaseColors.white);
  static const Color transparent = Color(BaseColors.transparent);
  static const Color black = Color(BaseColors.black);

  static const Color bgPrimaryTonalDefault = Color(BaseColors.brand100);
  static const Color bgPrimaryTonalHover = Color(BaseColors.brand200);
  static const Color bgPrimaryTonalFocus = Color(BaseColors.brand300);

  static const Color bgPrimarySolidDefault = Color(BaseColors.brand500);
  static const Color bgPrimarySolidHover = Color(BaseColors.brand400);
  static const Color bgPrimarySolidFocus = Color(BaseColors.brand600);

  static const Color bgDangerTonalDefault = Color(BaseColors.red100);
  static const Color bgDangerTonalHover = Color(BaseColors.red200);
  static const Color bgDangerTonalFocus = Color(BaseColors.red300);

  static const Color bgDangerSolidDefault = Color(BaseColors.red500);
  static const Color bgDangerSolidHover = Color(BaseColors.red400);
  static const Color bgDangerSolidFocus = Color.fromARGB(255, 253, 0, 0);

  static const Color bgNeutralLightDefault = Color(BaseColors.gray50);
  static const Color fbNeutralNormal = Color(BaseColors.gray500);

  static const Color bgNeutralLightHover = Color(BaseColors.gray100);

  static const Color bgNeutralDark = Color(BaseColors.gray200);
  static const Color bgNeutralLight = Color(BaseColors.gray50);
  static const Color bgSoftNeutral = Color(BaseColors.gray100);
  static const Color bgNeutralDisable = Color(BaseColors.gray300);
  static const Color bgPrimary = Color(BaseColors.brand500);
  static const Color bgDanger = Color(BaseColors.red500);

  static const Color bgWarning = Color(BaseColors.orange500);
  static const Color bgInProgress = Color(BaseColors.blue500);
  static const Color bgTenant = Color(BaseColors.yellow500);
  static const Color bgSuccess = Color(BaseColors.green500);
  static const Color bgSupplier = Color(BaseColors.violet500);
  static const Color bgHyperlink = Color(BaseColors.blue500);

  static const Color fgNeutralDisable = Color(BaseColors.gray300);
  static const Color fgNeutralSubtle = Color(BaseColors.gray400);
  static const Color fgNeutralNormal = Color(BaseColors.gray500);
  static const Color fgNeutralEmphasis = Color(BaseColors.gray600);
  static const Color fgNeutralHighEmphasis = Color(BaseColors.gray700);

  static const Color bgSupplierSolidDefault = Color(BaseColors.violet500);
  static const Color bgSupplierSolidHover = Color(BaseColors.violet400);
  static const Color bgSupplierSolidFocus = Color(BaseColors.violet600);

  static const Color bgWarningTonalDefault = Color(BaseColors.orange100);
  static const Color bgWarningTonalHover = Color(BaseColors.orange200);
  static const Color bgWarningTonalFocus = Color(BaseColors.orange300);

  static const Color bgWarningSolidDefault = Color(BaseColors.orange500);
  static const Color bgWarningSolidHover = Color(BaseColors.orange400);
  static const Color bgWarningSolidFocus = Color(BaseColors.orange600);

  static const Color bgTenantTonalDefault = Color(BaseColors.yellow100);
  static const Color bgTenantTonalHover = Color(BaseColors.yellow200);
  static const Color bgTenantTonalFocus = Color(BaseColors.yellow300);

  static const Color bgTenantSolidDefault = Color(BaseColors.yellow500);
  static const Color bgTenantSolidHover = Color(BaseColors.yellow400);
  static const Color bgTenantSolidFocus = Color(BaseColors.yellow600);

  static const Color bgSuccessTonalDefault = Color(BaseColors.green100);
  static const Color bgSuccessTonalHover = Color(BaseColors.green200);
  static const Color bgSuccessTonalFocus = Color(BaseColors.green300);

  static const Color bgSuccessSolidDefault = Color(BaseColors.green500);
  static const Color bgSuccessSolidHover = Color(BaseColors.green400);
  static const Color bgSuccessSolidFocus = Color(BaseColors.green600);

  static const Color bgPrimaryDisable = Color(BaseColors.brand300);
  static const Color bgNeutralTonalDefault = Color(BaseColors.gray50);
  static const Color bgNeutralTonalHover = Color(BaseColors.gray100);
  static const Color bgNeutralTonalFocus = Color(BaseColors.gray200);
  static const Color bgNeutralTonalDisable = Color(BaseColors.gray400);
  static const Color bgNeutralTonalSkeleton = Color(BaseColors.gray100);

  static const Color bgBlueTonalDefault = Color(BaseColors.blue100);
  static const Color bgBlueTonalHover = Color(BaseColors.blue200);
  static const Color bgBlueTonalFocus = Color(BaseColors.blue300);
  static const Color bgBlueTonalDisable = Color(BaseColors.blue400);
  static const Color bgBlueTonalSkeleton = Color(BaseColors.blue100);

  static const Color bgBlueSolidDefault = Color(BaseColors.blue500);
  static const Color bgBlueSolidHover = Color(BaseColors.blue400);
  static const Color bgBlueSolidFocus = Color(BaseColors.blue600);
  static const Color bgBlueSolidDisable = Color(BaseColors.blue400);
}
