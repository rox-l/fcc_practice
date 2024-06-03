#! /bin/bash

PSQL="psql -X --username=freecodecamp --dbname=salon --tuples-only -c"

SALON_MENU() {
  if [[ $1 ]]
  then
    echo -e "\n$1"
  fi
  echo -e "\nWelcome to the salon.\nWhat would you like to do?"
  echo -e "\nHere are the services we offer:"
  # get services
  SERVICES=$($PSQL "SELECT service_id, name FROM services ORDER BY service_id")
  echo "$SERVICES" | while read SERVICE_ID BAR SERVICE
  do
    echo "$SERVICE_ID) $SERVICE"
  done
  
  read SERVICE_ID_SELECTED
  # if service id is invalid
  if [[ ! $SERVICE_ID_SELECTED =~ [1-5] ]]
  then
    # get services
    SERVICES=$($PSQL "SELECT service_id, name FROM services ORDER BY service_id")
    echo "$SERVICES" | while read SERVICE_ID BAR SERVICE
    do
      echo "$SERVICE_ID) $SERVICE"
    done
  fi
  # if service is available, ask for customer number
  echo "Hi, could I have your phone number please?"
  read CUSTOMER_PHONE
  # check if customer has visited the store before by trying to retrieve customer name
  CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone='$CUSTOMER_PHONE'")
  # if customer has not visited the store before
  if [[ -z $CUSTOMER_NAME ]]
  then
    # ask for customer name
    echo "You are a new customer. May I have your name please?"
    read CUSTOMER_NAME
    # insert customer name and phone number into customers table
    INSERT_CUSTOMER=$($PSQL "INSERT INTO customers(name, phone) VALUES('$CUSTOMER_NAME', '$CUSTOMER_PHONE')")
  else
    echo "Welcome back $CUSTOMER_NAME!"
  fi
  # ask for appointment time
  SERVICE=$($PSQL "SELECT name FROM services WHERE service_id=$SERVICE_ID_SELECTED")
  echo "So $CUSTOMER_NAME, what time would you like your$SERVICE?"
  read SERVICE_TIME
  # get customer_id
  CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE'")
  # insert customer_id, time, service_id into appointments table
  INSERT_APPT=$($PSQL "INSERT INTO appointments(time, customer_id, service_id) VALUES('$SERVICE_TIME', $CUSTOMER_ID, '$SERVICE_ID_SELECTED')")
  # check if appointment is successfully added
  if [[ $INSERT_APPT == 'INSERT 0 1' ]]
  then
    echo "I have put you down for a $(echo $SERVICE | sed -r 's/^ *| *$//g') at $(echo $SERVICE_TIME | sed -r 's/^ *| *$//g'), $(echo $CUSTOMER_NAME | sed -r 's/^ *| *$//g')."
  else
    echo "Hmm, something has gone wrong. Please start the code again"
  fi
}

SALON_MENU