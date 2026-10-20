# Troubleshooting the User ID Error
I tried a few versions of the database commands because the script kept using an invalid user ID. The `INSERT ... RETURNING user_id` query returned both the ID and psql’s status text, such as `INSERT 0 1`. Capturing the output in a variable did not remove that extra text, so a later query failed with a syntax error near `INSERT`.
Redirecting query output also did not fix the incorrect ID and could hide useful errors. The final fix was to add `-q` to the psql command, which suppresses the extra status text while keeping the returned ID:
```bashPSQL="psql --username=freecodecamp --dbname=number\_guess -t --no-align -q -c"
