# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#Create Users
    User.create(name:'joe bloggs', email:'jb@here.com', password: "secret", password_confirmation: "secret")
    User.create(name:'joe Cloggs', email:'jc@here.com', password: "secret", password_confirmation: "secret")
    User.create(name:'jim smith', email:'js@here.com', password: "secret", password_confirmation: "secret")
# Associate some comments
    user = User.find(1)
    user.comments.create(content: "This book is interesting")
    user.comments.create(content: "This is very horrible,")
    user = User.find(2)
    user.comments.create(content: "The book describes ...")
    user = User.find(3)
    user.comments.create(content: "I think the book ...")
# Associate some books with comments
    Comment.find(1).books << scienceFiction
    Comment.find(2).books << horrible
    Comment.find(3).books << action
    Comment.find(4).books << romantic
# Add comment to comment
    user = User.find(1)
    comment = Comment.new(:content => "Great post")
    comment.user = user
    comment.comment = Comment.find(1)
    comment.save

    comment = Comment.new(:content => "I don't agree ...")
    comment.user = user
    comment.comment = Comment.find(2)
    comment.save

    comment = Comment.new(:content => "I don't agree either...")
    comment.user = User.find(2)
    comment.comment = Comment.find(2)
    comment.save