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

TaskList.create(task_name: 'Routine data')
TaskList.create(task_name: 'CRFs')
TaskList.create(task_name: 'Spec')
TaskList.create(task_name: 'Functional QC')
TaskList.create(task_name: 'Reports and DVS')
TaskList.create(task_name: 'Follow up')

User.create(email: 'max@gmail.com', username: 'max33', sign_in_count: 1, created_at: '2020-05-12 14:07:58.555354', updated_at: '2020-05-12 14:07:58.555354', encrypted_password: '$2a$11$JohnGeeL2TF82.KKIn/zXeT3O4tZgoRe3ouCYHQ3Oh5qoGa90chnW', admin: true)
User.create(email: 'michael@gmail.com', username: 'mike33', sign_in_count: 1, created_at: '2020-05-12 14:07:58.555354', updated_at: '2020-05-12 14:07:58.555354', encrypted_password: '$2a$11$MmEBnCX8iN3j1xNY7xP83uO51/rDIo2ITBjZoXguYlCvfa0CazGaC', admin: true)
