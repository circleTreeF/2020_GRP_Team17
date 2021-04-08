# Website Contributing Guide

This guide provides a brief overview of the development environment setup and project structure for our front-end project "Road Monitoring System". The following is the directory:

[TOC]

## 1. Basic Information

This front-end project "Road Monitoring System" is built based on the framework [Vue.js](https://vuejs.org/), [Element](https://element.eleme.cn/#/en-US) library and the [Amap](https://lbs.amap.com/) API. In addition, the login and registration pages use the  [reCAPTCHA v2](https://vuejsexamples.com/google-recaptcha-component-for-vue-js/) widget provided by Google .



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



## 3. Project Structure

```bash
├── build			# Project build (Webpack) related code.
├── config			# Configuration directory, including port number, etc.
├── dist			# The directory of the packaged project files.
├── node_modules	# Project dependency module loaded by npm.
└── src				# Main development folder.
    ├── assets          # Place some images, such as logos, etc.
    ├── components		# There are some component file.
    ├── router      	# Router Configuration.
    ├── App.vue  		# Project entry file.
    └── main.js			# The core file of the project.
├── static				# A directory of static resources.
├── .babelrc			
├── .editorconfig
├── .gitignore		# git configuration
├── .postcssrc.js
├── index.html		# Home entry file.
├── pacckage-lock.json
├── package.json	# Project profile.
├── README.md		# Documentation of the project in Markdown format.
└── yarn.lock

```









