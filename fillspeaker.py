import sqlite3
conn = sqlite3.connect('ascedb.sql')
c = conn.cursor()
c.execute("DELETE from Speaker")
	
with open('speakers.txt', 'r') as infile:
	global ablob;
	name = infile.readline().strip()
	title =	infile.readline().strip()
	picture_name = infile.readline().strip()
	pic_loc = 'speakerPictures/'+picture_name
	with open(pic_loc, 'rb') as f:
		ablob = f.read()
	while(infile.readline().strip() == "------"):
		c.execute("INSERT INTO Speaker (name, title, profile_pic) VALUES (?, ?, ?)" , (name, title, buffer(ablob)))
		
		name = infile.readline().strip()
		if(name == ""):
			break
		title =	infile.readline().strip()
		picture_name = infile.readline().strip()
		pic_loc = 'speakerPictures/'+picture_name
		print(pic_loc)
		with open(pic_loc, 'rb') as f:
			ablob = f.read()
	conn.commit()
conn.close()
