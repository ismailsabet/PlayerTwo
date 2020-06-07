# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Match.create([
  { user_1: 1, user_2: 4, user_1_approves: 'true', user_2_approves: 'true'},
  { user_1: 1, user_2: 5, user_1_approves: 'true', user_2_approves: 'true'},
  { user_1: 2, user_2: 5, user_1_approves: 'true', user_2_approves: 'true'},
  { user_1: 3, user_2: 6, user_1_approves: 'true', user_2_approves: 'true'}
  ])
