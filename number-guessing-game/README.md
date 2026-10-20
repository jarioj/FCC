# Troubleshooting the User ID Error

I tried different versions of the database commands because the script kept using an invalid user ID. The `INSERT ... RETURNING user_id` query returned the ID along with psql’s status text, such as `INSERT 0 1`. Capturing the output in a variable did not remove that extra text, so a later query failed with a syntax error near `INSERT`.

Redirecting query output did not fix the incorrect ID and could hide useful errors. The final fix was to add `-q` to the psql command, which suppresses the extra status text while keeping the returned ID:

```bash
PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -q -c"
```

After that change, `USER_ID` contained only the database ID, and the game could save results successfully.
