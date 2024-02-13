#! /bin/bash
PSQL="psql -X --username=freecodecamp --dbname=salon --tuples-only -c"
EXIT_MENU(){
  #get service name
  REGISTERED_NAME=$($PSQL "SELECT name FROM customers WHERE customer_id = '$CUSTOMER_ID'")
  FORMATTED_NAME=$(echo $REGISTERED_NAME | sed 's/^ //')
  SERVICE_NAME=$($PSQL "SELECT name FROM services WHERE service_id = $SERVICE_ID_SELECTED")
  FORMATTED_SERVICE_NAME=$(echo $SERVICE_NAME | sed 's/^ //')
  FAREWELL_MESSAGE="I have put you down for a $FORMATTED_SERVICE_NAME at $SERVICE_TIME, $FORMATTED_NAME."
  echo "$FAREWELL_MESSAGE"
}

CUT_MENU() {
  
  echo -e "\nWhat's your phone number?"
  read CUSTOMER_PHONE

  CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone = '$CUSTOMER_PHONE'")

  #if customer doesn't exist
  if [[ -z $CUSTOMER_NAME ]]
    then
    # get new customer name
    echo -e "\nWhat's your name?"
    read CUSTOMER_NAME

    # insert new customer
    INSERT_CUSTOMER_RESULT=$($PSQL "INSERT INTO customers(name, phone) VALUES('$CUSTOMER_NAME', '$CUSTOMER_PHONE')") 
  fi
  #get customer_id
  CUSTOMER_ID=$($PSQL "Select customer_id FROM customers WHERE phone = '$CUSTOMER_PHONE'")
  # get service_time
  echo -e '\nWhat time?'
  read SERVICE_TIME
  #add appointment
  INSERT_SERVICE_RESULT=$($PSQL "INSERT INTO appointments(customer_id, time, service_id) VALUES($CUSTOMER_ID, '$SERVICE_TIME', $SERVICE_ID_SELECTED)")
  EXIT_MENU     

}
  
 COLOR_MENU() {
  
  echo -e "\nWhat's your phone number?"
  read CUSTOMER_PHONE

  CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone = '$CUSTOMER_PHONE'")

  #if customer doesn't exist
  if [[ -z $CUSTOMER_NAME ]]
    then
    # get new customer name
    echo -e "\nWhat's your name?"
    read CUSTOMER_NAME

    # insert new customer
    INSERT_CUSTOMER_RESULT=$($PSQL "INSERT INTO customers(name, phone) VALUES('$CUSTOMER_NAME', '$CUSTOMER_PHONE')") 
  fi
  #get customer_id
  CUSTOMER_ID=$($PSQL "Select customer_id FROM customers WHERE phone = '$CUSTOMER_PHONE'")
  # get service_time
  echo -e '\nWhat time?'
  read SERVICE_TIME
  #add appointment
  INSERT_SERVICE_RESULT=$($PSQL "INSERT INTO appointments (customer_id,time, service_id) VALUES ($CUSTOMER_ID,'$SERVICE_TIME',$SERVICE_ID_SELECTED)")
        
  #get cust name
  #REGISTERED_NAME=$($PSQL "SELECT name FROM customers WHERE customer_id = '$CUSTOMER_ID'")
  EXIT_MENU
}

PERM_MENU() {
  
 echo -e "\nWhat's your phone number?"
  read CUSTOMER_PHONE

  CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone = '$CUSTOMER_PHONE'")

  #if customer doesn't exist
  if [[ -z $CUSTOMER_NAME ]]
    then
    # get new customer name
    echo -e "\nWhat's your name?"
    read CUSTOMER_NAME

    # insert new customer
    INSERT_CUSTOMER_RESULT=$($PSQL "INSERT INTO customers(name, phone) VALUES('$CUSTOMER_NAME', '$CUSTOMER_PHONE')") 
  fi
  #get customer_id
  CUSTOMER_ID=$($PSQL "Select customer_id FROM customers WHERE phone = '$CUSTOMER_PHONE'")
  # get service_time
  echo -e '\nWhat time?'
  read SERVICE_TIME
  #add appointment
  INSERT_SERVICE_RESULT=$($PSQL "INSERT INTO appointments (customer_id,time, service_id) VALUES ($CUSTOMER_ID,'$SERVICE_TIME',$SERVICE_ID_SELECTED)")
        
  #get cust name
  #REGISTERED_NAME=$($PSQL "SELECT name FROM customers WHERE customer_id = '$CUSTOMER_ID'")
  EXIT MENU
}

STYLE_MENU() {
  
 echo -e "\nWhat's your phone number?"
  read CUSTOMER_PHONE

  CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone = '$CUSTOMER_PHONE'")

  #if customer doesn't exist
  if [[ -z $CUSTOMER_NAME ]]
    then
    # get new customer name
    echo -e "\nWhat's your name?"
    read CUSTOMER_NAME
    # insert new customer
    INSERT_CUSTOMER_RESULT=$($PSQL "INSERT INTO customers(name, phone) VALUES('$CUSTOMER_NAME', '$CUSTOMER_PHONE')") 
  fi
  #get customer_id
  CUSTOMER_ID=$($PSQL "Select customer_id FROM customers WHERE phone = '$CUSTOMER_PHONE'")
  # get service_time
  echo -e '\nWhat time?'
  read SERVICE_TIME
  #add appointment
  INSERT_SERVICE_RESULT=$($PSQL "INSERT INTO appointments (customer_id,time, service_id) VALUES ($CUSTOMER_ID,'$SERVICE_TIME',$SERVICE_ID_SELECTED)")
        
  #get cust name
  #REGISTERED_NAME=$($PSQL "SELECT name FROM customers WHERE customer_id = '$CUSTOMER_ID'")
  EXIT_MENU
}

TRIM_MENU() {
  
 echo -e "\nWhat's your phone number?"
  read CUSTOMER_PHONE

  CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone = '$CUSTOMER_PHONE'")

  #if customer doesn't exist
  if [[ -z $CUSTOMER_NAME ]]
    then
    # get new customer name
    echo -e "\nWhat's your name?"
    read CUSTOMER_NAME

    # insert new customer
    INSERT_CUSTOMER_RESULT=$($PSQL "INSERT INTO customers(name, phone) VALUES('$CUSTOMER_NAME', '$CUSTOMER_PHONE')") 
  fi
  #get customer_id
  CUSTOMER_ID=$($PSQL "Select customer_id FROM customers WHERE phone = '$CUSTOMER_PHONE'")
  # get service_time
  echo -e '\nWhat time?'
  read SERVICE_TIME
  #add appointment
  INSERT_SERVICE_RESULT=$($PSQL "INSERT INTO appointments (customer_id,time, service_id) VALUES ($CUSTOMER_ID,'$SERVICE_TIME',$SERVICE_ID_SELECTED)")
        
  #get cust name
  #REGISTERED_NAME=$($PSQL "SELECT name FROM customers WHERE customer_id = '$CUSTOMER_ID'")
  EXIT_Menu
}

 


#}
MAIN_MENU() {
    if [[ $1 ]]
    then
    echo -e "\n$1"
    fi

    echo "How may I help you?" 
    echo -e "\n1) cut\n2) color\n3) perm\n4) style\n5) trim"
    read SERVICE_ID_SELECTED
    

    case $SERVICE_ID_SELECTED in
    1) CUT_MENU  ;;
    2) COLOR_MENU ;;
    3) PERM_MENU  ;;
    4) STYLE_MENU ;;
    5) TRIM_MENU  ;;
    *) MAIN_MENU "Please enter a valid option." ;;
    esac
}

MAIN_MENU
