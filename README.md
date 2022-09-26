# QuizU-Flutter
 

# Components 
## Answers
Styled And Formatted Widget For Answers Buttons.

## Bottom Navbar
Customized Bottom Navbar With Home Page, Leaderboard and Profile pages.

## Custom Route
Animation to navigate between pages.

## Networking
It has All API urls and a token to get from the local storage of the device
Start function to check if the token is valid.
Login function is passed an otp and mobile number and send post request.
Registe name is to send a post request and relate name with the mobile.
Get Top Ten is to fetch the data from the API call to get the top ten in the leaderboard to show them in the leaderboared page.
Get User Info is to retrieve user name and user mobiel number to show them in the profile.
Get Questions is to fetch the questions and send them to show them in the quiz page.
Send Score is to Send post request with the score to save it in the database.

## New Button
Customzied Button with styles, it can get content, color and a call back.

## Question
After Getting Questions from the API call, it convert them to question objects to easily deal with them.

## Quiz
It saves the 30 Questiosn and keeps track of the current question.

## Shared
Contains a title widget to show in different pages.

## Spin Kit
It contains loading animation to show on async calls to avoid empty screen.

# Screens
## Error 
Error Screen to show if error occured during the session.

## Finished Screen
Show the score of the user with an animation depends on his score, and a share button to share his score and challenge others.

## Leaderboard
It makes an API call on initiating with loading animation, after the call finished successfully it return the leaderboard with names and scores of the top ten users.

## Mobile Entry
It takes Formatted Mobile Number Input Depending on the country.

## Name Entry
Obtaining the name from the user and sending a post request.

## OTP
It shows default otp Text Fields and send login request after the user done it correctly.

## Profile
It shows user name and user mobile and previous scores in the session if he did not log out (or message to start quiz if he does not have any saved scores)

## Quiz Me 
It works as home page with a button to start the challenge.

## Quiz Page
It shows the question and change the question after the skip or choosing the right answer, if the answer is wrong it shows wrong page.

## Wrong 
if the answer is wrong, it shows an animation, if the user press try again he will start the quiz again, if he choose to leave it then he will return to the home page (Quiz Me).

## Constants
It contains Styles, fonts and colors of the theme of the application.

## Main
It starts the program by simple 'Hello Animation' and calls Networking to check if there is a valid token, if not it will show login page, if there is it will take the user to home page.