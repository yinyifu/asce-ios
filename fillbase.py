import sqlite3
conn = sqlite3.connect('ascedb.sql')
c = conn.cursor()
c.execute("DELETE from Event")
	
with open('database.txt', 'r') as infile:
	datefield = infile.readline().strip()
	stime =	infile.readline().strip()
	etime = infile.readline().strip()
	speaker =  infile.readline().strip()
	room =  infile.readline().strip()
	name =  infile.readline().strip()
	desc =  infile.readline().strip()
	mod =  infile.readline().strip()
	organ =  infile.readline().strip()

	while(infile.readline().strip() == "------"):
		c.execute("INSERT INTO Event (date, starttime, endtime, speakers, room, name, desc, mods, organizations) VALUES ('%s', '%s', '%s', '%s', '%s', '%s', '%s', '%s', '%s')" % (datefield, stime, etime, speaker, room, name, desc, mod, organ))
		
		datefield = infile.readline().strip()
		stime =	infile.readline().strip()
		etime = infile.readline().strip()
		speaker =  infile.readline().strip()
		room =  infile.readline().strip()
		name =  infile.readline().strip()
		desc =  infile.readline().strip()
		mod =  infile.readline().strip()
		organ =  infile.readline().strip()

	conn.commit()
conn.close()
