To construct the database, run the Database Construction.sql script. If there seems to be a problem with creating the database (for example, the location of the database file doesn't match the script's location) Then manually create an empty database named Test. After you have done this, remove the creation part of the Construction script (So remove the lines from CREATE DATABASE [Test] to the first GO statement)

Run the script again, and all of the tables should be created.

After the database has been created, you will need to run the INSERTER script, to test our results. If you have a commercial product, which allows you to insert values into the database automatically, then feel free to use that instead. 