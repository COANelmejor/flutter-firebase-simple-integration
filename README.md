# Flutter/Firebase Simple Integration

A new Flutter project that integrates Firebase with your app.

## Getting Started

This project is a starting point for a Flutter application that integrates Firebase with your app.

A few resources to get you started if this is your first Flutter project:

- [Get to know Firebase for Flutter](https://firebase.google.com/codelabs/firebase-get-to-know-flutter)
- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## Notes

### Add Windows Support

I got on a problem. When I tried to add support for Windows Desktop, I got an error becuase of the name of the folder.

The parent folder name was `flutter-firebase-simple-integration`. This name was created as a result of the github repo name.

To make it work, I had to rename the folder to `flutter_firebase_simple_integration`.

### Exception: The plugin cloud_firestore requires a higher Android SDK version

Some times flutter could be using an older version of the Minimun Android SDK.

And the terminal show you this:

```bash
The plugin cloud_firestore requires a higher Android SDK version.
Fix this issue by adding the following to the file
C:\<path-to-your-parent-folder>\flutter_firebase_simple_integration\android\app\build.gradle:
android {
  defaultConfig {
    minSdkVersion 19
  }
}
```

When you go to that folder adn file, you will see something like this:

```gradle
...
    defaultConfig {
        // TODO: Specify your own unique Application ID (https://developer.android.com/studio/build/application-id.html).
        applicationId "com.example.gtk_flutter"
        minSdkVersion flutter.minSdkVersion
        targetSdkVersion flutter.targetSdkVersion
        versionCode flutterVersionCode.toInteger()
        versionName flutterVersionName
    }
...
```

DO NOT CHANGE THE `minSdkVersion` MANUALLY.

You'll need to locate that `flutter.minSdkVersion` and it is in the flutter_tools folder that is
located on the binaries folder.

Normally, you should know it is located the flutter binaries folder.

But if you dont know, you can use the command `flutter doctor -v`

Here is a *Windows Example*:

```bash
flutter doctor -v
[√] Flutter (Channel stable, 2.8.1, on Microsoft Windows [Version 10.0.19043.1466], locale es-GT)
    • Flutter version 2.8.1 at C:\<path-to-parent-folder-of-flutter>\flutter
    • Upstream repository https://github.com/flutter/flutter.git
    • Framework revision 77d935af4d (7 weeks ago), 2021-12-16 08:37:33 -0800
    • Engine revision 890a5fca2e
    • Dart version 2.15.1
...
```

Locate de `Flutter version x.x.x` line. You will see where is the binary folder.

Got to that folder, a then locate this file `<folder-to-fllutter-binaries>\flutter\packages\flutter_tools\gradle\flutter.gradle`
and locate the `static int minSdkVersion` variable in `class FlutterExtension` and change it to `21`.

```gradle
/** For apps only. Provides the flutter extension used in app/build.gradle. */
class FlutterExtension {
    /** Sets the compileSdkVersion used by default in Flutter app projects. */
    static int compileSdkVersion = 31

    /** Sets the minSdkVersion used by default in Flutter app projects. */
    // static int minSdkVersion = 16
    static int minSdkVersion = 21

    /** Sets the targetSdkVersion used by default in Flutter app projects. */
    static int targetSdkVersion = 31

    /**
     * Specifies the relative directory to the Flutter project directory.
     * In an app project, this is ../.. since the app's build.gradle is under android/app.
     */
    String source

    /** Allows to override the target file. Otherwise, the target is lib/main.dart. */
    String target
}
```

The reason to be `21` is multidexing.

The `19` minsdkVersion will lead you to this exception:

```bash
FAILURE: Build failed with an exception.

* What went wrong:
Execution failed for task ':app:mergeDexDebug'.
> A failure occurred while executing com.android.build.gradle.internal.tasks.Workers$ActionFacade
   > com.android.builder.dexing.DexArchiveMergerException: Error while merging dex archives:
     The number of method references in a .dex file cannot exceed 64K.
     Learn how to resolve this issue at https://developer.android.com/tools/building/multidex.html
```

At the end of the exception, you will see this:

```bash
Do you want to continue with adding multidex support for Android? [y|n]: y
Multidex enabled. Retrying build.
```

This will create a new file at `<flutter-app-folder>/android/app/src/main/java/io/flutter/app`
called `FlutterMultiDexApplication.java`, that add support to multidex on verision `19`

Version `19` does not support multidexing natively but it is supported by the `21` version.

I recommend (personally) to use the `21` version, if you don't have trouble with your app.
