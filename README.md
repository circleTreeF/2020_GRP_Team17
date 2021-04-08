# Distributed Road Network Monitoring System

![Build status](https://csprojects.nottingham.edu.cn/scyyf1/2020_grp_17/badges/master/pipeline.svg)

[[_TOC_]]

## What

This repository is a project,  **Distributed Road Network Monitoring System**, developed by the 2020 GRP Team 17, School of Computer Science, University of Nottingham Ningbo China. See more about our project as the [project website](http://cslinux.nottingham.edu.cn/~Team202017/). This project is part of module Software Engineering Group Project (COMP 2043), School of Computer Science, University of Nottingham Ningbo China.

## Getting Started

This project consists of 3 component, mobile application, website, and back end.

Prerequisites

- [Git](https://git-scm.com)

### Back End

The server component is only developed and tested on 64-bit [Cent OS release 8.3.2011](https://wiki.centos.org/action/show/Manuals/ReleaseNotes/CentOS8.2011?action=show&redirect=Manuals%2FReleaseNotes%2FCentOSLinux8). Thanks to [Docker](https://www.docker.com/), these servers may work on other planforms, as long as meeting the following prerequisites.

#### Prerequisites

- [Docker](https://www.docker.com/)
- [Docker Engine](https://docs.docker.com/engine/)
- [Docker Compose](https://docs.docker.com/compose/)

#### Installation

1. Clone the repo

   `git clone git@csprojects.nottingham.edu.cn:scyyf1/2020_grp_17.git`

2. Find the back end directory

   ` cd 2020_grp_17/src/back/`

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

   `docker-compose up`

## Project development log

The development log is [here](../log/devLog.md).

## Contributing



## Contributors

We are Software Engineering Group Project 2020 Team 17. Here are our contact.

| Name          | Email                                                       |
| ------------- | ----------------------------------------------------------- |
| Yizirui Fang  | [scyyf1@nottingham.edu.cn](mailto:scyyf1@nottingham.edu.cn) |
| Shengnan Hu   | [scysh1@nottingham.edu.cn](mailto:scysh1@nottingham.edu.cn) |
| Hongming Ping | [scyhp1@nottingham.edu.cn](mailto:scyhp1@nottingham.edu.cn) |
| Shihui Que    | [scysq1@nottingham.edu.cn](mailto:scysq1@nottingham.edu.cn) |
| Qiyuan Wang   | [scyqw3@nottingham.edu.cn](mailto:scyqw3@nottingham.edu.cn) |





## Status

This project is under developing now. You may refer to the timeline of this project.

![timeline](../images/timeline.png)

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
