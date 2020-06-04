# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create([
  { firstname: 'Ismail', lastname: 'Sabet', gender: 'male', email: 'ismail@gmail.com', username: 'ismail', password: 'password', bio: 'Meeting new people!', dob: '1999-05-28'},
  { firstname: 'Roger', lastname: 'Chen', gender: 'male', email: 'roger@gmail.com', username: 'roger', password: 'password', bio: 'Meeting new people!', dob: '1999-05-28'},
  { firstname: 'Artur', lastname: 'Rybak', gender: 'male', email: 'artur@gmail.com', username: 'artur', password: 'password', bio: 'Meeting new people!', dob: '1999-05-28'},
  { firstname: 'Zoe', lastname: 'P', gender: 'female', email: 'zoe@gmail.com', username: 'zoe', password: 'password', bio: 'Meeting new people!', dob: '1999-05-28'},
  { firstname: 'Rachel', lastname: 'K', gender: 'female', email: 'rachel@gmail.com', username: 'rachel', password: 'password', bio: 'Meeting new people!', dob: '1999-05-28'},
  { firstname: 'Sarah', lastname: 'A',gender: 'female', email: 'sarah@gmail.com', username: 'sarah', password: 'password', bio: 'Meeting new people!', dob: '1999-05-28'},
  ])

Match.create([
  { user_1: 1, user_2: 4, user_1_approves: 'true', user_2_approves: 'true'},
  { user_1: 1, user_2: 5, user_1_approves: 'true', user_2_approves: 'true'},
  { user_1: 2, user_2: 5, user_1_approves: 'true', user_2_approves: 'true'},
  { user_1: 3, user_2: 6, user_1_approves: 'true', user_2_approves: 'true'}
  ])

Location.create([
  { user_id: 1, address1: 'Twyford Court', city: 'Guildford', country: 'UK', postcode: 'GU2'},
  { user_id: 2, address1: 'University Court', city: 'Guildford', country: 'UK', postcode: 'GU2'},
  { user_id: 3, address1: 'Bellerby Court', city: 'Guildford', country: 'UK', postcode: 'GU2'},
  { user_id: 4, address1: 'Manor Park', city: 'Guildford', country: 'UK', postcode: 'GU2'},
  { user_id: 5, address1: 'Battersea Court', city: 'Guildford', country: 'UK', postcode: 'GU2'},
  { user_id: 6, address1: 'Stag Hill', city: 'Guildford', country: 'UK', postcode: 'GU2'},
  ])
