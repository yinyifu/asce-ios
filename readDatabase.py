import sqlite3
conn = sqlite3.connect('ascedb.sql')
c = conn.cursor()
c.execute("SELECT * from Speaker")
alle = c.fetchall()
for al in alle:
	print(al)



