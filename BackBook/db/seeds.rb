# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create(name: 'AAAA', email: 'a@gmail.com', password: 'AAAAAA', role: "user")
User.create(name: 'BBBB', email: 'b@gmail.com', password: 'BBBBBB', role: "user")
User.create(name: 'CCCC', email: 'c@gmail.com', password: 'CCCCCC', role: "user")
User.create(name: 'Admin', email: 'admin@gmail.com', password: 'password', role: "admin")

Book.create(title: 'マチネの終わりに', price: 850, author: '平野啓一郎', stock: 10, release_day: "2019/06/10")
Book.create(title: '金閣寺', price: 670, author: '三島由紀夫', stock: 3, release_day: "1956/10/30")
Book.create(title: '春の雪', price: 630, author: '三島由紀夫', stock: 8, release_day: "1969/01/05")

Category.create(name: '小説')
Category.create(name: '純文学')
Category.create(name: '大衆小説')

Category.create(name: '恋愛', parent_id: 1)
Category.create(name: '冒険', parent_id: 1)
Category.create(name: 'ファンタジー', parent_id: 2)
