#!/bin/bash

# Define the psql variable
PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"

# Check for an argument
if [[ -z $1 ]]
then
  echo "Please provide an element as an argument."
  exit 0
fi

# Search for the element by atomic number, symbol or name
QUERY="SELECT e.atomic_number, e.name, e.symbol, t.type, p.atomic_mass,
p.melting_point_celsius, p.boiling_point_celsius
FROM elements e
JOIN properties p ON e.atomic_number = p.atomic_number
JOIN types t ON p.type_id = t.type_id
WHERE e.atomic_number::text = '$1' OR e.symbol = '$1' OR e.name = '$1'"

RESULT=$($PSQL "$QUERY")

# If the result is empty
if [[ -z $RESULT ]]
then
  echo "I could not find that element in the database."
else
  # Parse the result
  echo "$RESULT" | while read line; do
    atomic_number=$(echo $line | cut -d'|' -f1 | xargs)
    name=$(echo $line | cut -d'|' -f2 | xargs)
    symbol=$(echo $line | cut -d'|' -f3 | xargs)
    type=$(echo $line | cut -d'|' -f4 | xargs)
    mass=$(echo $line | cut -d'|' -f5 | xargs)
    melt=$(echo $line | cut -d'|' -f6 | xargs)
    boil=$(echo $line | cut -d'|' -f7 | xargs)

    echo "The element with atomic number $atomic_number is $name ($symbol). It's a $type, with a mass of $mass amu. $name has a melting point of $melt celsius and a boiling point of $boil celsius."
    done
  fi