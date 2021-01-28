## Agenda

- New Design
- Approach
- Features
- Setup
- Live Demo
- Learnings
- Pains

## Setup

```
flutter channel beta
flutter upgrade
flutter config --enable-web
flutter create . (add to existing project)
```

## Notes

- Creating a `Theme` based on `ColorScheme` by using `ThemeData.from()` does not provide the `fontFamily` property to apply a default font family (only the constructor of the general `ThemeData` class offers this...). Therefore we need to do:

```
ThemeData.from(
  colorScheme: colorScheme,
  textTheme: ThemeData.light().textTheme.apply(fontFamily: kFontFamilyAntipasto),
);
```

- ConstrainedContainer: be aware of the possibility of really big screen sizes, therefore limit the width of "normal" sections
- ResponsiveWrapper: dependency inversion principle - smart widget which checks whether we are on mobile or desktop (based on width rather than platform) and push down this information as form of a builder
- Not all layout decisions can respond fully responsive (for example by using the Wrap widget). For this instances we have to set breakpoints (a wrapper widget checking this) and layout a different widget tree which satisfies the given screen size

- Odyssee to getting GDrive files

- CORS!!!! -> https://cors-anywhere.herokuapp.com/

- SelectableText -> Otherwise its not possible to select and copy text from the website

- Mouse Pointer -> Gotta think about it, e.g. GestureDetector doesnt have it "out-of-the-box"

- Disable drawer open gesture because on phones (e.g. iOS) it also triggers the back-swipe -> However closing swipe gesture is nice tho

- Cool thing: The app is out-of-the-box a Chrome app / PWA which means it can be installed instantly from the browser -> Short showcase

- Frequent issues with debugging/usage of breakpoints in general (mostly changing them while the application is running)

- FontManifest
  - Providing the fonts only in the pubspec is not enough
  - In addition, you need to create a FontManifest.json in the web/assets folder
  - This will make the used custom fonts available for the webapp