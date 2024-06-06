#!/bin/bash

# Enable querying from database
PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"

if [[ -z $1 ]] # if no input is given
then 
  echo Please provide an element as an argument.

elif [[ $1 =~ ^(1[0]|[1-9])$ ]] # input is a number between 1 and 10
then
  VARS=$($PSQL "SELECT * FROM properties INNER JOIN elements USING(atomic_number) INNER JOIN types USING(type_id) WHERE atomic_number=$1")
  echo $VARS | while IFS='|' read TYPE_ID ATOMIC_NUMBER ATOMIC_MASS MELT_PT BOIL_PT SYMBOL NAME TYPE
  do
    echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MELT_PT celsius and a boiling point of $BOIL_PT celsius."
  done

elif [[ ${#1} -le 2 ]] # input is two characters or less and therefore could be symbol
then
  # check if it is a valid symbole
  NAME=$($PSQL "SELECT name FROM elements WHERE symbol='$1'")
  if [[ -z $NAME ]] # not a valid symbol
  then
    echo I could not find that element in the database.
  else
    VARS=$($PSQL "SELECT * FROM properties INNER JOIN elements USING(atomic_number) INNER JOIN types USING(type_id) WHERE symbol='$1'")
    echo $VARS | while IFS='|' read TYPE_ID ATOMIC_NUMBER ATOMIC_MASS MELT_PT BOIL_PT SYMBOL NAME TYPE
      do
    echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MELT_PT celsius and a boiling point of $BOIL_PT celsius."
      done
  fi

elif [[ ${#1} -gt 2 ]] # input is longer than 2 characters and therefore maybe a name
then # check if it is a valid name
  SYMBOL=$($PSQL "SELECT symbol FROM elements WHERE name='$1'")
  if [[ -z $SYMBOL ]] # not a valid name
  then
    echo I could not find that element in the database.
  else
    VARS=$($PSQL "SELECT * FROM properties INNER JOIN elements USING(atomic_number) INNER JOIN types USING(type_id) WHERE name='$1'")
    echo $VARS | while IFS='|' read TYPE_ID ATOMIC_NUMBER ATOMIC_MASS MELT_PT BOIL_PT SYMBOL NAME TYPE
      do
    echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MELT_PT celsius and a boiling point of $BOIL_PT celsius."
      done
  fi

else # input is not name, symbol, or atomic number
  echo I could not find that element in the database.
fi
