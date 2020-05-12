# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


User.where(email:
               'users@gmail.com').first_or_create(password:
                                                                       'mdp123', password_confirmation: 'mdp123')

task_lists.create(task_name: 'routine data')
task_lists.create(task_name: 'late phase CTIMP')
task_lists.create(task_name: 'early phase CTIMP')
task_lists.create(task_name: 'complex intervention')
task_lists.create(task_name: 'REDCAP observational')
