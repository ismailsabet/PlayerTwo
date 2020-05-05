# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create([
  { firstname: 'Ismail', lastname: 'Sabet', email: 'ismail@gmail.com', username: 'ismail', password: 'password', bio: 'Meeting new people!', dob: '1999-05-28'},
  { firstname: 'Roger', lastname: 'Chen', email: 'roger@gmail.com', username: 'roger', password: 'password', bio: 'Meeting new people!', dob: '1999-05-28'},
  { firstname: 'Artur', lastname: 'Rybak', email: 'artur@gmail.com', username: 'artur', password: 'password', bio: 'Meeting new people!', dob: '1999-05-28'},
  { firstname: 'Zoe', lastname: 'P', email: 'zoe@gmail.com', username: 'zoe', password: 'password', bio: 'Meeting new people!', dob: '1999-05-28'},
  { firstname: 'Rachel', lastname: 'K', email: 'rachel@gmail.com', username: 'rachel', password: 'password', bio: 'Meeting new people!', dob: '1999-05-28'},
  { firstname: 'Sarah', lastname: 'A', email: 'sarah@gmail.com', username: 'sarah', password: 'password', bio: 'Meeting new people!', dob: '1999-05-28'},
  ])

Like.create([
  { user_id: 1, liked_user_id: 4},
  { user_id: 4, liked_user_id: 1},
  { user_id: 2, liked_user_id: 5},
  { user_id: 5, liked_user_id: 2},
  { user_id: 3, liked_user_id: 6},
  { user_id: 6, liked_user_id: 3},
  ])
