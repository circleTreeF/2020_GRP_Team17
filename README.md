# Distributed Road Network Monitoring System

![Build status](https://csprojects.nottingham.edu.cn/scyyf1/2020_grp_17/badges/master/pipeline.svg)

[![License](https://img.shields.io/badge/license-mit-green.svg)](LICENSE)

[[_TOC_]]

## What

This repository is a project,  **Distributed Road Network Monitoring System**, developed by the 2020 GRP Team 17, School of Computer Science, University of Nottingham Ningbo China. See more about our project as the [project website](http://cslinux.nottingham.edu.cn/~Team202017/). This project is part of module Software Engineering Group Project (COMP 2043), School of Computer Science, University of Nottingham Ningbo China.

## Status

This project developed with the following roadmap, and is now finished.

![timeline](../images/timeline.png)

## Getting Started

This project consists of 3 component, mobile application, website, and back end.

Prerequisites

- [Git](https://git-scm.com)
- University of Nottingham Ningbo China Campus VPN Connection if use our working server

### Back End

The server component is only developed and tested on 64-bit [Cent OS release 8.3.2011](https://wiki.centos.org/action/show/Manuals/ReleaseNotes/CentOS8.2011?action=show&redirect=Manuals%2FReleaseNotes%2FCentOSLinux8). Thanks to [Docker](https://www.docker.com/), these servers may work on other planforms, as long as meeting the following prerequisites. To access the website, please specify the port to 8866.

#### Prerequisites

- [Docker](https://www.docker.com/)
- [Docker Engine](https://docs.docker.com/engine/)
- [Docker Compose](https://docs.docker.com/compose/)
- Accessibility of the port 8866

#### Installation

1. Clone the repo

   ```bash
   git clone git@csprojects.nottingham.edu.cn:scyyf1/2020_grp_17.git
   ```

2. Find the back end directory

   ```bash
   cd 2020_grp_17/src/back/
   ```


3. Add host into the `ALLOWED_HOSTS` in `myServer/settings.py`
    ```python
    ALLOWED_HOSTS = ['10.6.2.61', '<NEW_HOST_NAME']
    ```

4. Make sure the position correct, `src/myServer`, which contains `manage.py`

   example:

    ```bash
    pwd
    // <Project_Directory>/src/myServer
    ```

5. Start the back end servers

   ```bash
   docker-compose up
   ```

### Mobile Application

#### Prerequisites

This part will show you the prerequisites before you start to develop our project.

##### For Windows

###### System requirements

| **Operating System** | Windows 7 or Later.                                    |
| -------------------- | ------------------------------------------------------ |
| **Disk Space**       | 400 MB (It does not include disk space for IDE/tools). |
| **Tools**            | 1. Windows PowerShell  2. Git for Windows 2.x.         |
| **SDK**              | Flutter SDK for Windows                                |
| **IDE**              | **Android Studio (Official)**                          |

###### Guidance 

1. You should follow all steps in the [Flutter Official website: Installation for Windows](https://flutter.dev/docs/get-started/install/windows)
2. You should follow all steps in the [Flutter Official website:: Setting up the editor](https://flutter.dev/docs/get-started/editor)



##### For Mac

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



#### **Installation**

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

    - If you want to test the IOS Application using real devices on Mac, 
        Open **mobile_app/ios/Runner.xcworkspace** in Xcode, 
        choose the ios devices then click the Run button in Xcode.
        then if you want to test the release version on real devices, run 

        ```
        $ flutter run --release
        ```

        in the terminal.

### Website

#### Introduction


This front-end project "Road Monitoring System" is built based on the framework [Vue.js](https://vuejs.org/), [Element](https://element.eleme.cn/#/en-US) library and the [Amap](https://lbs.amap.com/) API. In addition, the login and registration pages use the  [reCAPTCHA v2](https://vuejsexamples.com/google-recaptcha-component-for-vue-js/) widget provided by Google . which provides high-level visualization of the collected data about the road condition.  The website has three parts "Login ", registration and "Map".



#### Installation project dependency

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



#### Commonly used NPM scripts

```
# watch and auto re-build dist/vue.js
$ npm run dev

# build all dist files, including npm packages
$ npm run build
```

## Document

- [Mobile Application Project Document](src/mobile_app/doc/api/index.html)

- [API Document](https://documenter.getpostman.com/view/12382637/Tz5nce5H)

- [Website Project Readme](src/web/road_monitoring_system/README.md)

    
## Test

- [Mobile Application Test](docs/log/app_test_log.md)
- [API Test Log](docs/logs/API_test_log.md)

## Contributing

To contribute to this project , please refer to the [`CONTRIBUTION.md]`(CONTRIBUTION.md)

## Contributors

We are Software Engineering Group Project 2020 Team 17. Here are our contact.

| Name          | Email                                                       |
| ------------- | ----------------------------------------------------------- |
| Yizirui Fang  | [scyyf1@nottingham.edu.cn](mailto:scyyf1@nottingham.edu.cn) |
| Shengnan Hu   | [scysh1@nottingham.edu.cn](mailto:scysh1@nottingham.edu.cn) |
| Hongming Ping | [scyhp1@nottingham.edu.cn](mailto:scyhp1@nottingham.edu.cn) |
| Shihui Que    | [scysq1@nottingham.edu.cn](mailto:scysq1@nottingham.edu.cn) |
| Qiyuan Wang   | [scyqw3@nottingham.edu.cn](mailto:scyqw3@nottingham.edu.cn) |

## Project development log

The development log is [here](../log/devLog.md).



## More info

See more about our project as the [project website](http://cslinux.nottingham.edu.cn/~Team202017/).

## License

Distributed under MIT License. See `LICENSE ` for more information

## Acknowledgements

- [Dr Matthew Pike, Project Supervisor](https://www.nottingham.edu.cn/en/Science-Engineering/People/Profile.aspx?id=c856979f-d2aa-47ab-b2b5-3a611c28e461&language=en-GB)
- [Dr Dave Towey, Module Convenor](https://www.nottingham.edu.cn/en/Science-Engineering/People/Profile.aspx?id=bb1f4f26-2f23-4a34-a9cc-b7a10a1fb1a8&language=en-GB)
- [Django](https://www.djangoproject.com/)
- [Flutter](https://flutter.dev/)
- [Vue.js](https://vuejs.org/)
- [Docker](https://www.docker.com/)
- [Docker Engine](https://docs.docker.com/engine/)
- [Docker Compose](https://docs.docker.com/compose/)
