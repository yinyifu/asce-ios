import csv
import sqlite3

conn=sqlite3.connect("ascedb.sql")
c=conn.cursor()

data = c.execute("SELECT * FROM Event")
with open("events.csv", 'w', newline="") as f:
	writer = csv.writer(f)
	writer.writerow(['Date', 'Start Time','End Time', 'Presenters', 'Location', 'Name', 'Description', 'Moderators', 'Organizations'])
	writer.writerows(data)
