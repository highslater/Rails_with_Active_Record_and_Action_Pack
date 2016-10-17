# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


Book.destroy_all
Reviewer.destroy_all

Book.create! [
  {name: "Eloquent Ruby", author: "Russ Olsen"},
  {name: "Begining Ruby", author: "Peter Cooper"},
  {name: "Metaprogramming Ruby", author: "Paolo Perrotta"},
  {name: "Design Patterns in Ruby", author: "Russ Olsen"},
  {name: "The Ruby Programming Language", author: "David Flanigan"}
]

eloquent = Book.find_by name: "Eloquent Ruby"
eloquent.notes.create! [
  {title: "Wow", note: "Greate Book to Learn Ruby"},
  {title: "Funny", note: "Doesn't put you to sleep"}
]

reviewers = Reviewer.create! [
  {name: "Joe", password: "abc123"},
  {name: "Jim", password: "123abd"}
]

Book.all.each do |book|
  book.reviewer = reviewers.sample
  book.save
end
