// Historically this file declared `IconDataBrands`, `IconDataSolid`,
// `IconDataRegular`, `IconDataLight`, `IconDataDuotone`, `IconDataThin`,
// and the `IconDataSharp*` variants. They each extended `IconData` to bake in
// a fontFamily / fontPackage. Flutter marked `IconData` as a `final class`, so
// extending it is no longer allowed.
//
// Icon constants in `font_awesome_flutter.dart` now construct `IconData`
// directly with the appropriate fontFamily, eliminating the need for these
// wrappers. The file is kept (intentionally empty) so existing transitive
// imports continue to resolve.
library;
