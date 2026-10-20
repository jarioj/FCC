#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -q -c"

echo "Enter your username: "
read username

# Get user info from database
USER_ID=$($PSQL "SELECT user_id FROM users WHERE username='$username'" | xargs)

if [[ -z $USER_ID ]]
then
  # New user
  echo "Welcome, $username! It looks like this is your first time here."
  # Insert new user and get their ID
  USER_ID=$($PSQL "INSERT INTO users(username) VALUES('$username') RETURNING user_id" | xargs)
else
  # Existing user
  GAMES_PLAYED=$($PSQL "SELECT COUNT(*) FROM games WHERE user_id=$USER_ID" | xargs)
  BEST_GAME=$($PSQL "SELECT MIN(guesses) FROM games WHERE user_id=$USER_ID" | xargs)

  echo "Welcome back, $username! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
fi

SECRET_NUMBER=$(( RANDOM % 1000 + 1 ))
GUESS_COUNT=0

echo "Guess the secret number between 1 and 1000:"

while true
do
  read guess 
  # Validate if input is an integer
  if [[ ! $guess =~ ^[0-9]+$ ]]
  then
   echo "That is not an integer, guess again:"
   continue
  fi

  (( GUESS_COUNT++ ))

  if [[ $guess -eq $SECRET_NUMBER ]]
  then
    echo "You guessed it in $GUESS_COUNT tries. The secret number was $SECRET_NUMBER. Nice job!"
    # Save the game results to the database
    GAME_RESULT=$($PSQL "INSERT INTO games(user_id, guesses) VALUES($USER_ID, $GUESS_COUNT)")
    break
  elif [[ $guess -gt $SECRET_NUMBER ]]
  then
    echo "It's lower than that, guess again:"
  else
    echo "It's higher than that, guess again:"
  fi
done
