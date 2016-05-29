# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:

  Flat.create(id: 1, address: 'Wita Stwosza 57, Gdańsk', total_charges: 400)
  Flatmate.create([
    {firstname: 'Dariusz', lastname: 'Buszman', phone: '111 111 111',
     email: 'dariusz@example.com', password: 'zaq12wsx', admin: true, Flat_id: 1,
     charges: 100, is_payed: false},
    {firstname: 'Klaudia', lastname: 'Pałkowska', phone: '222 222 222',
     email: 'klaudia@example.com', password: 'zaq12wsx', Flat_id: 1,
     charges: 100, is_payed: true},
    {firstname: 'Aneta', lastname: 'Stypa', phone: '333 333 333',
     email: 'aneta@example.com', password: 'zaq12wsx', Flat_id: 1,
     charges: 100, is_payed: true},
    {firstname: 'Marta', lastname: 'Walczak', phone: '444 444 444',
     email: 'marta@example.com', password: 'zaq12wsx', Flat_id: 1,
     charges: 100, is_payed: false}])
