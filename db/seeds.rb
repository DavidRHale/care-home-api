monica = Resident.create(first_name: 'Monica', last_name: 'Geller', dob: '1955-07-16', favourite_food: 'Bacon')
rachel = Resident.create(first_name: 'Rachel', last_name: 'Green', dob: '1932-06-30', favourite_food: 'Spaghetti')
phoebe = Resident.create(first_name: 'Phoebe', last_name: 'Buffay', dob: '1944-12-19', favourite_food: 'Vegetables')
ross = Resident.create(first_name: 'Ross', last_name: 'Geller', dob: '1940-03-01', favourite_food: 'Pasta')
chandler = Resident.create(first_name: 'Chandler', last_name: 'Bing', dob: '1927-11-21', favourite_food: 'Chinese')
joey = Resident.create(first_name: 'Joey', last_name: 'Tribbiani', dob: '1943-11-08', favourite_food: 'Pizza')

Room.create(name: '1F1', resident_id: monica.id)
Room.create(name: '1F12', resident_id: rachel.id)
Room.create(name: '2F1', resident_id: phoebe.id)
Room.create(name: '2F2', resident_id: ross.id)
Room.create(name: '3F1', resident_id: chandler.id)
Room.create(name: '3F2', resident_id: joey.id)