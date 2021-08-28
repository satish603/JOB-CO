# JOB&CO

## Running a Flutter application

You can use the `flutter start` command to run Flutter apps on your devices.

First, change directories to the root of your app (the same directory that
contains the `pubspec.yaml` file for your project).

To start your app, run:

```
$ flutter start
```
## Viewing the logs

Start streaming the logs from the device:

```
$ flutter logs
```

The `logs` command lets you see textual output from your app, including `print`
statements and unhandled exceptions. To avoid confusion from old log messages,
you might want to use `flutter logs --clear` to clear the logs between runs.

## Features
We focussed our efforts to build an intuitive ,clean and simple UI. For the same, we encompassed card UI in our app. We also implemented swipeable tabs so as to provide ease in navigating between different fragments.

## login
The 'Login' activity is added in order to verify the credentials of an authorized user. The user needs to enter proper credentials to access the rest of the functionalities.

## SignUp
The 'Sign up' activity allows the user to register himself in Job Vibe. This will allow the user to search and apply for Jobs. During the sign up process, the user must first enter a valid email address followed by a password of his/her choice(minimum 8 charaters needed). After this process is completed, the user will be asked to fill some more blanks regarding his/her personal and education information.

## Obtaining Service account file
Using your Google account, login to Firebase console: https://console.firebase.google.com/

See Example below

1. Project Settings ->
2. Service Accounts ->
3. Generate new private key

![1](https://user-images.githubusercontent.com/60779510/131218563-bec45343-9699-43e7-a9a8-c3d49caba333.png)
