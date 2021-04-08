| No.              | 1                                          |
| ---------------- | ------------------------------------------ |
| <Test Funcution> | Login page                                 |
| Description      | Test all the interactive items on the page |

| Index | Test cases             | Description(Expected Result)                                 | Actual Result         | Test time        | Tester      | Result | Remarks           |
| ----- | ---------------------- | ------------------------------------------------------------ | --------------------- | ---------------- | ----------- | ------ | ----------------- |
| 1     | User name and password | User name and password input box should be input successfully | Same as expected      | 2021/3/22 20: 18 | Qiyuan Wang | Passed |                   |
| 2     | Visual of password     | The password needs to change visible / invisible according to the status of the right eye icon | Same as expected      | 2021/3/22 20: 20 | Qiyuan Wang | Passed |                   |
| 3     | "Login" Button         | After entering the correct user name and password, click "Login" should log in successfully | Button not responding | 2021/3/22 20: 37 | Qiyuan Wang | Failed | Wrong user name   |
|       |                        |                                                              | Button not responding | 2021/3/22 20: 38 | Qiyuan Wang | Failed | Wrong Password    |
|       |                        |                                                              | Same as expected      | 2021/3/22 20: 39 | Qiyuan Wang | Passed |                   |
| 4     |                        | After clicking "sign up", should be able to jump to the sign up page | Button not responding | 2021/3/22 20: 42 | Qiyuan Wang | Failed | Jump link not set |
|       |                        |                                                              | Same as expected      | 2021/3/23 12: 42 | Qiyuan Wang | Passed |                   |

| No.              | 2                                          |
| ---------------- | ------------------------------------------ |
| <Test Funcution> | Sign up Page                               |
| Description      | Test all the interactive items on the page |

| Index | Test cases | Description(Expected Result)                                 | Actual Result         | Test time        | Tester        | Result | Remarks           |
| ----- | ---------- | ------------------------------------------------------------ | --------------------- | ---------------- | ------------- | ------ | ----------------- |
| 1     |            | User name and password input box should be input successfully | Same as expected      | 2021/3/22 20: 43 | Qiyuan Wang   | Passed |                   |
| 2     |            | The password needs to change visible / invisible according to the status of the right eye icon | Button not responding | 2021/3/22 20: 43 | Hongming Ping | Failed | Jump link not set |
|       |            |                                                              | Same as expected      | 2021/3/22 20: 48 | Qiyuan Wang   | Passed |                   |
| 3     |            | After entering a reasonable user name and password, should click Register to register successfully | Button not responding | 2021/3/22 20: 50 | Hongming Ping | Failed | Jump link not set |
|       |            |                                                              | Same as expected      | 2021/3/22 12: 55 | Qiyuan Wang   | Passed |                   |



| Index | Test cases | Description(Expected Result)                                 | Actual Result                             | Test time        | Tester      | Result | Remarks                                |
| ----- | ---------- | :----------------------------------------------------------- | ----------------------------------------- | ---------------- | :---------- | ------ | -------------------------------------- |
| 1     |            | After clicking the "start" button, the program should start to work and displays each index | error: The 'longitude' was called on null | 2021/3/22 21: 25 | Qiyuan Wang | Failed | Should wait for seconds                |
|       |            |                                                              | Index did not display                     | 2021/3/23 13: 27 | Qiyuan Wang | Failed | Data cannot be collected               |
|       |            |                                                              | Button not responding                     | 2021/3/23 13: 28 | Qiyuan Wang | Failed | App does not have location permissions |
|       |            |                                                              | Longitude and latitude are not displayed  | 2021/3/24 18: 02 | Qiyuan Wang | Failed | Should wait for seconds                |
|       |            |                                                              | Same as expected                          | 2021/3/24 18: 17 | Qiyuan Wang | Passed |                                        |
| 2     |            | After clicking the "stop" button,  should end the test and display the test results | Button not responding                     | 2021/3/24 18: 30 | Qiyuan Wang | Failed | Jump link not set                      |
|       |            |                                                              | The test result always shows D            | 2021/3/24 18: 33 | Qiyuan Wang | Failed | The test time is too short             |
|       |            |                                                              | Same as expected                          | 2021/3/24 18: 35 | Qiyuan Wang | Passed |                                        |
| 3     |            | After clicking the time button in the lower right corner , should jump to the query page | Button not responding                     | 2021/3/22 21: 28 | Qiyuan Wang | Failed | Jump link not set                      |
|       |            |                                                              | Same as expected                          | 2021/3/22 13: 35 | Qiyuan Wang | Passed |                                        |
| 4     |            | After clicking the top left button or sliding left, should jump to the personal information page | Button not responding                     | 2021/3/22 21: 30 | Qiyuan Wang | Failed | Jump link not set                      |
|       |            |                                                              | Same as expected                          | 2021/3/22 21: 32 | Qiyuan Wang | Passed |                                        |
| 1     |            | After clicking "Home" or sliding right, should jump to the Driving Page | Same as expected                          | 2021/3/22 21: 34 | Qiyuan Wang | Passed |                                        |
| 2     |            | After clicking "About us", should jump to the "About us" Page | Button not responding                     | 2021/3/22 21: 35 | Qiyuan Wang | Failed | Jump link not set                      |
|       |            |                                                              | Same as expected                          | 2021/3/22 13: 45 | Qiyuan Wang | Passed |                                        |
| 3     |            | After clicking "Sign Out", should jump to the Login Page     | Jump to another page                      | 2021/3/22 21: 35 | Qiyuan Wang | Failed | Link setting error                     |
|       |            |                                                              | Same as expected                          | 2021/3/22 13: 48 | Qiyuan Wang | Passed |                                        |
| 4     |            | After clicking the shutdown button at the bottom, should jump to the Login Page | Same as expected                          | 2021/3/22 21: 36 | Qiyuan Wang | Passed |                                        |
| 1     |            | After clicking the top left button or sliding left, should jump to the personal information page | Same as expected                          | 2021/3/22 21: 37 | Qiyuan Wang | Passed |                                        |
| 2     |            | After clicking"Find us on Gitlab", should open the Gitlab page of the project | Browser not responding                    | 2021/3/22 21: 38 | Qiyuan Wang | Failed | Network link error                     |
|       |            |                                                              | Same as expected                          | 2021/3/22 13: 50 | Qiyuan Wang | Passed |                                        |
| 1     |            | After entering the correct date in the date column and click the search button, should display all the records of the day. | Button not responding                     | 2021/3/22 21: 41 | Qiyuan Wang | failed | Wrong format of date                   |
|       |            |                                                              | Button not responding                     | 2021/3/22 21: 42 | Qiyuan Wang | failed | There was no record of that day        |
|       |            |                                                              | Button not responding                     | 2021/3/24 18: 43 | Qiyuan Wang | failed | Date does not exist                    |
|       |            |                                                              | Button not responding                     | 2021/3/24 18: 55 | Qiyuan Wang | failed | Jump link not set                      |
|       |            |                                                              | Same as expected                          | 2021/3/24 18: 58 | Qiyuan Wang | Passed |                                        |
| 2     |            | After clicking the top right button or sliding left, should jump to the Driving page | Button not responding                     | 2021/3/24 19: 35 | Qiyuan Wang | Failed | Jump link not set                      |
|       |            |                                                              | Same as expected                          | 2021/3/24 19: 58 | Qiyuan Wang | Passe  |                                        |
|       |            |                                                              |                                           |                  |             |        |                                        |



| No.              | 3                                          |
| ---------------- | ------------------------------------------ |
| <Test Funcution> | Driving Page                               |
| Description      | Test all the interactive items on the page |

| Index | Test cases | Description(Expected Result)                                 | Actual Result                             | Test time        | Tester      | Result | Remarks                                |
| ----- | ---------- | :----------------------------------------------------------- | ----------------------------------------- | ---------------- | :---------- | ------ | -------------------------------------- |
| 1     |            | After clicking the "start" button, the program should start to work and displays each index | error: The 'longitude' was called on null | 2021/3/22 21: 25 | Qiyuan Wang | Failed | Should wait for seconds                |
|       |            |                                                              | Index did not display                     | 2021/3/23 13: 27 | Qiyuan Wang | Failed | Data cannot be collected               |
|       |            |                                                              | Button not responding                     | 2021/3/23 13: 28 | Qiyuan Wang | Failed | App does not have location permissions |
|       |            |                                                              | Longitude and latitude are not displayed  | 2021/3/24 18: 02 | Qiyuan Wang | Failed | Should wait for seconds                |
|       |            |                                                              | Same as expected                          | 2021/3/24 18: 17 | Qiyuan Wang | Passed |                                        |
| 2     |            | After clicking the "stop" button,  should end the test and display the test results | Button not responding                     | 2021/3/24 18: 30 | Qiyuan Wang | Failed | Jump link not set                      |
|       |            |                                                              | The test result always shows D            | 2021/3/24 18: 33 | Qiyuan Wang | Failed | The test time is too short             |
|       |            |                                                              | Same as expected                          | 2021/3/24 18: 35 | Qiyuan Wang | Passed |                                        |
| 3     |            | After clicking the time button in the lower right corner , should jump to the query page | Button not responding                     | 2021/3/22 21: 28 | Qiyuan Wang | Failed | Jump link not set                      |
|       |            |                                                              | Same as expected                          | 2021/3/22 13: 35 | Qiyuan Wang | Passed |                                        |
| 4     |            | After clicking the top left button or sliding left, should jump to the personal information page | Button not responding                     | 2021/3/22 21: 30 | Qiyuan Wang | Failed | Jump link not set                      |
|       |            |                                                              | Same as expected                          | 2021/3/22 21: 32 | Qiyuan Wang | Passed |                                        |



| No.              | 4                                          |
| ---------------- | ------------------------------------------ |
| <Test Funcution> | Personal information page                  |
| Description      | Test all the interactive items on the page |

| Index | Test cases | Description(Expected Result)                                 | Actual Result         | Test time        | Tester      |
| ----- | ---------- | :----------------------------------------------------------- | --------------------- | ---------------- | :---------- |
| 1     |            | After clicking "Home" or sliding right, should jump to the Driving Page | Same as expected      | 2021/3/22 21: 34 | Qiyuan Wang |
| 2     |            | After clicking "About us", should jump to the "About us" Page | Button not responding | 2021/3/22 21: 35 | Qiyuan Wang |
|       |            |                                                              | Same as expected      | 2021/3/22 13: 45 | Qiyuan Wang |
| 3     |            | After clicking "Sign Out", should jump to the Login Page     | Jump to another page  | 2021/3/22 21: 35 | Qiyuan Wang |
|       |            |                                                              | Same as expected      | 2021/3/22 13: 48 | Qiyuan Wang |
| 4     |            | After clicking the shutdown button at the bottom, should jump to the Login Page | Same as expected      | 2021/3/22 21: 36 | Qiyuan Wang |

| No.              | 5                                          |
| ---------------- | ------------------------------------------ |
| <Test Funcution> | "About us" Page                            |
| Description      | Test all the interactive items on the page |

| Index | Test cases | Description(Expected Result)                                 | Actual Result          | Test time        | Tester      |
| ----- | ---------- | :----------------------------------------------------------- | ---------------------- | ---------------- | :---------- |
| 1     |            | After clicking the top left button or sliding left, should jump to the personal information page | Same as expected       | 2021/3/22 21: 37 | Qiyuan Wang |
| 2     |            | After clicking"Find us on Gitlab", should open the Gitlab page of the project | Browser not responding | 2021/3/22 21: 38 | Qiyuan Wang |
|       |            |                                                              | Same as expected       | 2021/3/22 13: 50 | Qiyuan Wang |



| No.              | 6                                          |
| ---------------- | ------------------------------------------ |
| <Test Funcution> | Query page                                 |
| Description      | Test all the interactive items on the page |

| Index | Test cases | Description(Expected Result)                                 | Actual Result         | Test time        | Tester      | Result | Remarks                         |
| ----- | ---------- | :----------------------------------------------------------- | --------------------- | ---------------- | :---------- | ------ | ------------------------------- |
| 1     |            | After entering the correct date in the date column and click the search button, should display all the records of the day. | Button not responding | 2021/3/22 21: 41 | Qiyuan Wang | failed | Wrong format of date            |
|       |            |                                                              | Button not responding | 2021/3/22 21: 42 | Qiyuan Wang | failed | There was no record of that day |
|       |            |                                                              | Button not responding | 2021/3/24 18: 43 | Qiyuan Wang | failed | Date does not exist             |
|       |            |                                                              | Button not responding | 2021/3/24 18: 55 | Qiyuan Wang | failed | Jump link not set               |
|       |            |                                                              | Same as expected      | 2021/3/24 18: 58 | Qiyuan Wang | Passed |                                 |
| 2     |            | After clicking the top right button or sliding left, should jump to the Driving page | Button not responding | 2021/3/24 19: 35 | Qiyuan Wang | Failed | Jump link not set               |
|       |            |                                                              | Same as expected      | 2021/3/24 19: 58 | Qiyuan Wang | Passed |                                 |