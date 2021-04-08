# GRP Team 17

This repository is a project for the 2020 GRP Team 17. See more about our project as the [project website](http://cslinux.nottingham.edu.cn/~Team202017/).

[![License](https://img.shields.io/badge/license-mit-green.svg)](LICENSE)What

This package is a project of **Distributed Road Network Monitoring System**. This project is part of University of Nottingham Ningbo China, School of Computer Science module COMP 2043 Software Engineering Group Project. 

# Who

We are Software Engineering Group Project 2020 Team 17. Here are our contact.

| Name          | Email                                                       |
| ------------- | ----------------------------------------------------------- |
| Yizirui Fang  | [scyyf1@nottingham.edu.cn](mailto:scyyf1@nottingham.edu.cn) |
| Shengnan Hu   | [scysh1@nottingham.edu.cn](mailto:scysh1@nottingham.edu.cn) |
| Hongming Ping | [scyhp1@nottingham.edu.cn](mailto:scyhp1@nottingham.edu.cn) |
| Shihui Que    | [scysq1@nottingham.edu.cn](mailto:scysq1@nottingham.edu.cn) |
| Qiyuan Wang   | [scyqw3@nottingham.edu.cn](mailto:scyqw3@nottingham.edu.cn) |



# Usage

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
2. You should follow all steps in the [[Flutter Official website:: Setting up the editor](https://flutter.dev/docs/get-started/editor)



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
2. You should follow all steps in the [Flutter Official website: Setting up the editor](https://flutter.dev/docs/get-started/editor)



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

   - If you want to test the IOS Application using real devices on Mac,  enter 

     ```
     $ flutter run --release
     ```

     in the terminal or click the Run button in Xcode.

     

     



# Project development log

The development log is [here](../log/devLog.md).

# Status

This project is under developing now. You may refer to the timeline of this project.

![timeline](../images/timeline.png)

# More info

See more about our project as the [project website](http://cslinux.nottingham.edu.cn/~Team202017/).





# Website

## 1. Introduction

This front-end project "Road Monitoring System" is built based on the framework [Vue.js](https://vuejs.org/), [Element](https://element.eleme.cn/#/en-US) library and the [Amap](https://lbs.amap.com/) API. In addition, the login and registration pages use the  [reCAPTCHA v2](https://vuejsexamples.com/google-recaptcha-component-for-vue-js/) widget provided by Google . which provides high-level visualisation of the collected data about the road conditon.  The website has three parts "Login ", registration and "Map".

## 2. Development Setups

### 2.1 Installation project dependency

You will need [Node.js](http://nodejs.org/) **version 8+** and npm  (or [yarn](https://yarnpkg.com/en/docs/install)). After cloning the repo, run:

$ yarn # install the dependencies of the project

```
$ npm install webpack -g  # install the webpack
```

```
$ npm install vue-cli -g  # install vue-cli
```

```
$ yarn # install the dependencies of the project
```

**or**

```
$ npm install # install the dependencies of the project
```

you can see resources on [npm-install | npm Docs](https://docs.npmjs.com/cli/v7/commands/npm-install)



### 2.2 Commonly used NPM scripts

```
# watch and auto re-build dist/vue.js
$ npm run dev

# build all dist files, including npm packages
$ npm run build
```





