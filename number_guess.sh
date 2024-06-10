#!/bin/bash

# This script will randomly generate a number 
# that users have to guess

PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

# PARAMETERS TO INITIALIZE
RE='^[0-9]+$' # to check if an integer
NUM_GUESSES=1
# generate random number
SECRET_NUMBER=$((RANDOM % 1000 + 1))
echo "The secret number is: $SECRET_NUMBER"

# Function to get for username input
INITIALIZE_GAME() {
  # prompt user for username
  echo Enter your username: 
  read USERNAME
  # check that string length is <= 22
  if [[ ${#USERNAME} -gt 22 ]]
  then
    echo Your username is too long. Please choose one that is less than 22 characters
  else
    # check if USERNAME is already in database
    CHECK_USERNAME=$($PSQL "SELECT username FROM games WHERE username='$USERNAME'")
    # if new user
    if [[ -z $CHECK_USERNAME ]]
    then
      # output message
      echo Welcome, $USERNAME! It looks like this is your first time here.
    else # existing user, so get games_played and best_game
      GAMES_PLAYED=$($PSQL "SELECT games_played FROM games WHERE username='$USERNAME'")
      BEST_GAME=$($PSQL "SELECT best_game FROM games WHERE username='$USERNAME'")
      # output message
      echo Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses.
    fi
  fi
}

GUESS_SECRET() {
  echo Guess the secret number between 1 and 1000:
  while [[ $USER_GUESS != $SECRET_NUMBER ]]
  do
    read USER_GUESS
    if [[ ! $USER_GUESS =~ $RE ]]
    then
      echo "That is not an integer, guess again:"
      NUM_GUESSES=$((NUM_GUESSES+1))
    elif [[ $USER_GUESS -lt $SECRET_NUMBER ]]
    then
      echo "It's higher than that, guess again:"
      NUM_GUESSES=$((NUM_GUESSES+1))
    elif [[ $USER_GUESS -gt $SECRET_NUMBER ]]
    then
      echo "It's lower than that, guess again:"
      NUM_GUESSES=$((NUM_GUESSES+1))
    fi
    # NUM_GUESSES=$((NUM_GUESSES+1))
  done
  echo "You guessed it in $NUM_GUESSES tries. The secret number was $SECRET_NUMBER. Nice job!"
}

# After game is over, update table with: 
UPDATE_TABLE(){
  # if new user
  CHECK_GAMES_PLAYED=$($PSQL "SELECT games_played FROM games WHERE username='$USERNAME'")
  if [[ -z $CHECK_GAMES_PLAYED ]]
  then
    # Update variables
    GAMES_PLAYED=1
    BEST_GAME=$NUM_GUESSES
     # Insert username, games_played, best_game into table
    UPDATE_TABLE=$($PSQL "INSERT INTO games(username, games_played, best_game) VALUES('$USERNAME', $GAMES_PLAYED, $BEST_GAME)")
  # if existing user: games_played + 1, best_game (whichever is the lowest score)
  else
    # Retrieve existing variables
    GAMES_PLAYED=$($PSQL "SELECT games_played FROM games WHERE username='$USERNAME'")
    NEW_GAMES_PLAYED=$((GAMES_PLAYED+1))

    BEST_GAME=$($PSQL "SELECT best_game FROM games WHERE username='$USERNAME'")

    # update new best game ONLY if num_guesses < best_game
    if [[ $NUM_GUESSES -lt $BEST_GAME ]]
    then
      NEW_BEST_GAME=$NUM_GUESSES
    else
      NEW_BEST_GAME=$BEST_GAME
    fi
    # UPDATE variables in table
    UPDATE_GAMES_PLAYED=$($PSQL "UPDATE games SET games_played=$NEW_GAMES_PLAYED WHERE username='$USERNAME'")
    UPDATE_BEST_GAME=$($PSQL "UPDATE games SET best_game=$NEW_BEST_GAME WHERE username='$USERNAME'")

  fi
}

INITIALIZE_GAME

GUESS_SECRET

UPDATE_TABLE