# API TEST LOG DOCUMENTATION



[TOC]

## 1. Description

**Author:**  API developer *Shihui QUE*

**Test tool:** Postman

**Objective:** Test whether the return value of the interface is correct under different conditions to record the development and repair process. This documentation improves the maintainability of the project interface development and helps new developers learn about the interface more quickly.

**Tip:** This document can be viewed in conjunction with the interface documentation for better understanding.



## 2. Test Tool

This test uses Postman to test API for different cases in one collection and each API has several examples. Postman is a collaboration platform for API development. Postman's features simplify each step of building an API and streamline collaboration. It supports get, post, response validation, variable management, environment parameter management,  etc.  















## 3. Test Log

### 3.1 App User Register

| NO.1                 |                                              |
| -------------------- | -------------------------------------------- |
| **API Name**         | App client user register                     |
| **URL**              | /statistic/app_user_register                 |
| **Request Header**   | Content-Type: application/json               |
| **Request   Method** | POST                                         |
| **Description**      | Returns true if user registered successfully |



**Test Result** :

| Index | **Description**                | **Request   Method** | **Request Parameter**                       | **Expected  Result**                                    | Actual  Result                                          | **Status** |
| :---- | ------------------------------ | -------------------- | ------------------------------------------- | ------------------------------------------------------- | ------------------------------------------------------- | ---------- |
| 1.1   | Add User   to the 'App' group  | POST                 | {"username" : 0000,  "password" : "123456"} | {"result" : true, "message": "Registered Successfully"} | ERROR                                                   | Fail       |
| 1.2   | Add User   to the 'App' group  | POST                 | {"username" : 0000,  "password" : "123456"} | {"result" : true, "message": "Registered Successfully"} | {"result" : true, "message": "Registered Successfully"} | Pass       |
| 1.3   | User registration duplicate    | POST                 | {"username" : 0000,  "password" : "123456"} | {"result" : true}                                       | ERROR                                                   | Fail       |
| 1.4   | User registration duplicate    | POST                 | {"username" : 0000,  "password" : "123456"} | {"result" : true, "message": "Duplicate username"}      | {"result" : true, "message": "Duplicate username"}      | Pass       |
| 1.5   | User registration successfully | POST                 | {"username" : 0000, "password" : "123456"}  | {"result" : true, "message": "Registered Successfully"} | {"result" : true, "message": "Registered Successfully"} | Pass       |
| 1.6   | Wrong request type             | GET                  | username=0000&password=123456               | Wrong request type                                      | ERROR                                                   | Fail       |
| 1.7   | Wrong request type             | GET                  | username=0000&password=123456               | Wrong request type                                      | Wrong request type                                      | Pass       |



**Change From Test** :

| Reference  | Change                                              |
| ---------- | --------------------------------------------------- |
| 1.1 to 1.2 | Instantiate the Group object before add user        |
| 1.3 to 1.4 | Add exception handling when username   is duplicate |
| 1.6 to 1.7 | Add exception handling when request way is wrong    |

### 3.2. App User Login

| NO.2                 |                                                              |
| -------------------- | ------------------------------------------------------------ |
| **API Name**         | App client user login                                        |
| **URL**              | /statistic/app_user_login                                    |
| **Request Header**   | Content-Type: application/json                               |
| **Request   Method** | POST                                                         |
| **Description**      | Returns true if user login successfully (user must be registered) |



**Test Result** :

| Index | **Description**                         | **Request   Method** | **Request Parameter**                       | **Expected  Result**                                       | Actual  Result                                             | **Status** |
| ----- | --------------------------------------- | -------------------- | ------------------------------------------- | ---------------------------------------------------------- | ---------------------------------------------------------- | ---------- |
| 2.1   | User login  failed                      | POST                 | {"username" : 0000}                         | Key error                                                  | Key error                                                  | Pass       |
| 2.2   | User login with wrong password/username | POST                 | {"username" : 7777,  "password" : "123456"} | {"result" : false, "data":null}                            | {"result" : false, "data":null}                            | Pass       |
| 2.3   | Return user information                 | POST                 | {"username" : 7777,  "password" : "123456"} | User information                                           | ERROR                                                      | Fail       |
| 2.4   | Return user information                 | POST                 | {"username" : 7777,  "password" : "123456"} | User information                                           | User information                                           | Pass       |
| 2.5   | Return format error                     | POST                 | {"username" : 0000, "password" : "123456"}  | {"result" : true, "data"；[{"id":17, "username": "0000"}]} | {"result" : true, "data"；Object}                          | Fail       |
| 2.6   | User login successfully                 | POST                 | {"username" : 0000, "password" : "123456"}  | {"result" : true, "data"；[{"id":17, "username": "0000"}]} | {"result" : true, "data"；[{"id":17, "username": "0000"}]} | Pass       |
| 2.7   | Wrong request type                      | GET                  | username=0000&password=123456               | Wrong request type                                         | Wrong request type                                         | Pass       |



**Change From Test** :

| Reference  | Change                                     |
| ---------- | ------------------------------------------ |
| 2.3 to 2.4 | Convert  the result from query set to list |
| 2.5 to 2.6 | Only required fields are returned          |









### 3.3. Add Record

| NO.3                 |                                                              |
| -------------------- | ------------------------------------------------------------ |
| **API Name**         | App client add user record                                   |
| **URL**              | /statistic/add_record                                        |
| **Request Header**   | Content-Type: application/json                               |
| **Request   Method** | POST                                                         |
| **Description**      | Returns true and rank if  add user record successfully (user must be login) |



**Test Result** :

| Index | **Description**         | **Request   Method** | **Request Parameter**                                        | **Expected  Result**         | Actual  Result               | **Status** |
| ----- | ----------------------- | -------------------- | ------------------------------------------------------------ | ---------------------------- | ---------------------------- | ---------- |
| 3.1   | Add record  failed      | POST                 | {"user_id" : 23}                                             | Key error                    | Key error                    | Pass       |
| 3.2   | Return is null          | POST                 | {"user_id" : 23, "round_log" : {data}, "round_mark" : "D", "end_time":"2021-03-14", "start_time":"2021-03-14"} | {"result" : true, "rank": 4} | {"result" : true, "rank": 4} | Fail       |
| 3.3   | Add record successfully | POST                 | {"user_id" : 23, "round_log" : {data}, "round_mark" : "D", "end_time":"2021-03-14", "start_time":"2021-03-14"} | {"result" : true, "rank": 4} | {"result" : true, "rank": 4} | Pass       |
| 3.4   | Wrong request type      | GET                  | username=0000&password=123456                                | Wrong request type           | Wrong request type           | Pass       |



**Change From Test** :

| Reference  | Change                  |
| ---------- | ----------------------- |
| 3.2 to 3.3 | Change the sorted order |















### 3.4. Get Record

| NO.4                 |                                                |
| -------------------- | ---------------------------------------------- |
| **API Name**         | App client get user record                     |
| **URL**              | /statistic/get_record                          |
| **Request Header**   | Content-Type: application/json                 |
| **Request   Method** | GET                                            |
| **Description**      | Returns query data by date(user must be login) |



**Test Result** :

| Index | **Description**                              | **Request   Method** | **Request Parameter**               | **Expected  Result**                                         | Actual Result                                                | **Status** |
| ----- | -------------------------------------------- | -------------------- | ----------------------------------- | ------------------------------------------------------------ | ------------------------------------------------------------ | ---------- |
| 4.1   | Get record  failed                           | GET                  | {"user_id" : 23}                    | Key error                                                    | Key error                                                    | Pass       |
| 4.2   | Gramma Error                                 | GET                  | user_id=23&date=all                 | A list which contains all user's history record              | ERROR                                                        | Fail       |
| 4.3   | Get record successfully                      | GET                  | user_id=23&date=all                 | A list which contains all user's history record              | A list which contains all user's history record              | Pass       |
| 4.4   | Get record with particular date successfully | GET                  | user_id=23&date=2021-2-24           | A list which contains all user's history record in 2021-2-24 this day | A list which contains all user's history record in 2021-2-24 this day | Pass       |
| 4.5   | Wrong request type                           | POST                 | {"user_id": 23, "date" : 2021-2-24} | Wrong request type                                           | Wrong request type                                           | Pass       |



**Change From Test** :

| Reference  | Change                                                      |
| ---------- | ----------------------------------------------------------- |
| 4.2 to 4.3 | Change "_date" search filter to "__date" (double underline) |

### 3.5. Web User Register

| NO.5                 |                                                              |
| -------------------- | ------------------------------------------------------------ |
| **API Name**         | Web client user register                                     |
| **URL**              | /statistic/web_user_register                                 |
| **Request Header**   | Content-Type: application/json                               |
| **Request   Method** | POST                                                         |
| **Description**      | Returns true if user registered successfully, otherwise return error message |



**Test Result** :

| Index | **Description**                | **Request   Method** | **Request Parameter**                       | **Expected  Result**                                    | Actual Result                                            | **Status** |
| ----- | ------------------------------ | -------------------- | ------------------------------------------- | ------------------------------------------------------- | -------------------------------------------------------- | ---------- |
| 5.1   | User registration  failed      | POST                 | {"username" : 0000}                         | Key error                                               | Key error                                                | Pass       |
| 5.2   | User registration duplicate    | POST                 | {"username" : 0000,  "password" : "123456"} | Duplicate username                                      | Duplicate username                                       | Pass       |
| 5.3   | Registered but no permission   | POST                 | Waiting for management                      | {"result" : false, "message": "Waiting for management"} | {"result" : false, "message": "Registered Successfully"} | Fail       |
| 5.4   | Registered but no permission   | POST                 | Waiting for management                      | {"result" : false, "message": "Waiting for management"} | {"result" : false, "message": "Waiting for management"}  | Pass       |
| 5.5   | User registration successfully | POST                 | {"username" : 0000, "password" : "123456"}  | {"result" : true, "message": "Registered Successfully"} | {"result" : true, "message": "Registered Successfully"}  | Pass       |
| 5.6   | Wrong request type             | GET                  | username=0000&password=123456               | Wrong request type                                      | Wrong request type                                       | Pass       |



**Change From Test** :

| Reference  | Change               |
| ---------- | -------------------- |
| 5.3 to 5.4 | Change error message |





### 3.6. Web User Login

| NO.6                 |                                                              |
| -------------------- | ------------------------------------------------------------ |
| **API Name**         | Web client user login                                        |
| **URL**              | /statistic/web_user_login                                    |
| **Request Header**   | Content-Type: application/json                               |
| **Request   Method** | POST                                                         |
| **Description**      | Returns true if user login successfully (user must be registered and has permission) |



**Test Result** :

| Index | **Description**                         | **Request   Method** | **Request Header**             | **Request Parameter**                       | **Expected  Result**                                         | Actual Result                                                | **Status** |
| ----- | --------------------------------------- | -------------------- | ------------------------------ | ------------------------------------------- | ------------------------------------------------------------ | ------------------------------------------------------------ | ---------- |
| 6.1   | User has no permissions                 | POST                 | Content-Type: application/json | {"username" : 0000, "password" : "123456"}  | {"result" : false}                                           | {"result" : false}                                           | Fail       |
| 6.2   | User has no permissions                 | POST                 | Content-Type: application/json | {"username" : 0000, "password" : "123456"}  | {"result" : false}                                           | {"result" : false, "message": "No permission"}               | Pass       |
| 6.3   | User login  failed                      | POST                 | Content-Type: application/json | {"username" : 0000}                         | Key error                                                    | Key error                                                    | Pass       |
| 6.4   | User login with wrong password/username | POST                 | Content-Type: application/json | {"username" : 7777,  "password" : "123456"} | {"result" : false, "message": "Incorrect username or password"} | {"result" : false, "message": "Incorrect username or password"} | Pass       |
| 6.5   | User login successfully                 | POST                 | Content-Type: application/json | {"username" : 0000, "password" : "123456"}  | {"result" : true, "message": "Login successfully"}           | {"result" : true, "message": "Login successfully"}           | Pass       |
| 6.6   | Wrong request type                      | GET                  | Content-Type: application/json | username=0000&password=123456               | Wrong request type                                           | Wrong request type                                           | Pass       |



**Change From Test** :

| Reference  | Change                                                       |
| ---------- | ------------------------------------------------------------ |
| 6.1 to 6.2 | Separates case that the user are already registered but do not have permission |











### 3.7. Web Get Bad Points

| NO.7                 |                                         |
| -------------------- | --------------------------------------- |
| **API Name**         | Web client get bad points               |
| **URL**              | /statistic/get_bad_point                |
| **Request Header**   | Content-Type: application/json          |
| **Request   Method** | GET                                     |
| **Description**      | Returns query data (user must be login) |



**Test Result** :

| Index | **Description**                                  | **Request   Method** | **Request Parameter** | **Expected  Result**                                         | Actual Result                                                | **Status** |
| ----- | ------------------------------------------------ | -------------------- | --------------------- | ------------------------------------------------------------ | ------------------------------------------------------------ | ---------- |
| 7.1   | Get bad points with particular date successfully | GET                  | date=2021-2-24        | A list which contains all user's history record in 2021-2-24 this day | A list which contains all user's history record in 2021-2-24 this day | Pass       |
| 7.2   | Wrong request type                               | POST                 | {"date": 2021-2-24}   | Wrong request type                                           | Wrong request type                                           | Pass       |



**Change From Test** : Nothing.