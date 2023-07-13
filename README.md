# prl__swid
A simple script that let you switch someones Identifiers


# How to use

1. Go to your database.
2. Search for your license (you can find it out with txAdmin). It doesn't matter if it is a "license:1234" "1234" or "steam:1234".
3. Each data table with a hit you write in the ./server/swid.lua in the lines with the database entries.
   Example: MySQL.Async.execute("UPDATE `THE TABLE NAME` SET `THE NAME OF THE IDENTIFIER (OWNER, IDENTIFIER, LICENSE)`=@identifier2 WHERE `REPEAT THE NAME OF THE IDENTIFIER`=@identifier", {['@identifier'] = identifier, ['@identifier2'] = identifier2})
4. Repeat this until you have entered all records.
5. Finished


# Warning
  You should only make this change for fresh accounts that don't have anything yet, because the active progress will be lost and overwritten with the old one.
