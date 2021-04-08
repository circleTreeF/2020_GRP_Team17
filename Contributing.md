# RoadMonitoringSystemApp Contributing Guide

Hi! I'm really excited that you are interested in contributing to RoadMonitoringSystem Application. Before submitting your contribution, please make sure to take a moment and read through the following guidelines:

- [Pull Request Guidelines](#pull-request-guidelines)
- [Development](#development-setup)
- [Project Structure](#project-structure)

## Pull Request Guidelines

- The `master` branch is just a snapshot of the latest stable release. All development should be done in dedicated branches. **Do not submit PRs against the `master` branch.**

- Work in the `src` folder.

- It's OK to have multiple small commits as you work on the PR - GitHub will automatically squash it before merging.

- Make sure ` test` passes. 

- If adding a new feature:
  - Add accompanying test case.
  - Provide a convincing reason to add this feature. Ideally, you should open a suggestion issue first and have it approved before working on it.

- If fixing bug:
  - If you are resolving a special issue, add `(fix #xxxx[,#xxxx])` (#xxxx is the issue id) in your PR title for a better release log.
  - Add appropriate test coverage if applicable.

## Development 



### Prerequisites

This part will show you the prerequisites before you start to develop our project.

#### For Windows

###### System requirements

| **Operating System** | Windows 7 or Later.                                    |
| -------------------- | ------------------------------------------------------ |
| **Disk Space**       | 400 MB (It does not include disk space for IDE/tools). |
| **Tools**            | 1. Windows PowerShell  2. Git for Windows 2.x.         |
| **SDK**              | Flutter SDK for Windows                                |
| **IDE**              | **Android Studio (Official)**                          |

###### Guidance 

1. You should follow all steps in the [Flutter Official website: Installation for Windows](https://flutter.dev/docs/get-started/install/windows)
2.  You should follow all steps in the [[Flutter Official website:: Setting up the editor](https://flutter.dev/docs/get-started/editor)



#### For Mac

###### System requirements

| **Operating System** | macOS (64-bit)                                         |
| -------------------- | ------------------------------------------------------ |
| **Disk Space**       | 2.8 GB (It does not include disk space for IDE/tools). |
| **Tools**            | bash curl git 2.x mkdir rm unzip which                 |
| **IDE**              | **Xcode (Official) and AndroidStudio (Official)**      |
| **SDK**              | Flutter SDK for Mac                                    |

###### Guidance 

1. You should follow all steps in the [Flutter Official website: installation for Mac](https://flutter.dev/docs/get-started/install/macos)
2.  You should follow all steps in the [Flutter Official website: Setting up the editor](https://flutter.dev/docs/get-started/editor)



### **Installation**

1. Clone the repository

```
$ git clone git@csprojects.nottingham.edu.cn:scyyf1/2020_grp_17.git
```

2. After cloning the repo, find the RoadMonitoringSystemApp directory:

``` bash
$ cd 2020_grp_17/src/RoadMonitoringSystemApp/
```

3. Open the project RoadMonitoringSystemApp in AndroidStudio

4. Open the `pubspec.yaml `file in Android Studio 

5. Click 

   ```
   Pub get
   ```

   to gets dependencies for a non-Flutter package. (see [pub get](https://dart.dev/tools/pub/cmd) )

6. To run our project, you can follow the approach to run the app introduced in [Flutter official website:  test-drive .](https://flutter.dev/docs/get-started/test-drive)

   Some other ways you may want to choose to run our code :

   - If  you want to test the IOS Application using simulator on Mac, you can choose to open simulator in the following steps

     - ​     Click `Open IOS Simulator `  in the Target Selector

     - ​      Click `File`->`Open Simulato`r->`IOS 14.4` ->Choose one phone

   -  If you want to test the IOS Application using real devices on Mac,  enter 

     ```
  $ flutter run --release
     ```
   
     in the terminal or click the Run button in Xcode.

     
  
     

## Project Structure

- **`android`**: contains build-related scripts and configuration files for android application. Usually, you don't need to touch them. However, you need to familiar with the  condiguration file **AndroidManifest.xml**, the main update for configuration is shown below.

  ```
  <uses-permission
      android:name="android.permission.INTERNET"
      android:maxSdkVersion="30" />
  <uses-permission
      android:name="android.permission.ACCESS_COARSE_LOCATION"
      android:maxSdkVersion="30" />
  <uses-permission
      android:name="android.permission.ACCESS_FINE_LOCATION"
      android:maxSdkVersion="30" />
  <uses-permission
      android:name="android.permission.HIGH_SAMPLING_RATE_SENSORS"
      android:maxSdkVersion="30" />
  ```

- **`ios`**:  contains build-related scripts and configuration files for ios application. Usually, you don't need to touch them. However, you need to familiar with the  condiguration file **info.pList** , the main update for configuration is shown below.

  <img src="/Users/apple/Library/Application Support/typora-user-images/Screen Shot 2021-04-08 at 2.19.45 AM.png" alt="Screen Shot 2021-04-08 at 2.19.45 AM" style="zoom:36%;" />

- **`test`**: contains all unit-tests. 

- **`lib`**: contains the source code. 

- **`doc/api`**: contains the code documentation

## Release Contribution

if you want to build and release the application, follow the guidance in the following website:

- [Release application Guide](https://developer.android.google.cn/studio/publish#publishing-prepare)

- [build and release an Android app](https://flutter.dev/docs/deployment/android)

  notice: The Key information are in android->Key->info.md

- [build and release an iOS app](https://flutter.dev/docs/deployment/ios)

  

## Code documentation Contribution

If you want to generate the code documentation, follow the guidance in the following website:

- [Dartdoc in the dart package]( https://pub.flutter-io.cn/packages/dartdoc)
- [Dartdoc command](https://dart.cn/tools/dartdoc)



