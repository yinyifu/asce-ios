import sqlite3
conn = sqlite3.connect('ascedb.sql')
c = conn.cursor()
conn.text_factory = str
c.execute("DELETE from Event")
	
with open('database.txt', 'r') as infile:
	datefield = infile.readline().strip()
	stime =	infile.readline().strip()
	etime = infile.readline().strip()
	speaker =  infile.readline().strip()
	room =  infile.readline().strip()
	name =  infile.readline().strip()
	desc =  infile.readline().strip().replace("\\n", "\n").replace("\\t", "")
	mod =  infile.readline().strip()
	organ =  infile.readline().strip()
	splet = set()
	while(infile.readline().strip() == "------"):
		arysp = speaker.split(",")
		for item in arysp:
			splet.add(item.strip())
		arymd = mod.split(",")
		for item in arymd:
			splet.add(item.strip())

		c.execute("INSERT INTO Event(date, starttime, endtime, speakers, room, name, desc, mods, organizations) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)", (datefield, stime, etime, speaker, room, name, desc, mod, organ))
		
		datefield = infile.readline().strip()
		stime =	infile.readline().strip()
		etime = infile.readline().strip()
		speaker =  infile.readline().strip()
		room =  infile.readline().strip()
		name =  infile.readline().strip()
		desc =  infile.readline().strip().replace("\\n", "\n").replace("\\t", "")
		mod =  infile.readline().strip()
		organ =  infile.readline().strip()
		print(splet)	

	conn.commit()
conn.close()
