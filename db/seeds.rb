require 'random_data'

 5.times do
   User.create!(
 # #3
   name:     RandomData.random_name,
   email:    RandomData.random_email,
   password: RandomData.random_sentence
   )
 end

 users = User.all

 15.times do
   Topic.create!(
     name:         RandomData.random_sentence,
     description:  RandomData.random_paragraph
   )
 end
 topics = Topic.all

 # Create Posts
 50.times do
 # #1
   Post.create!(
 # #2
     user:  users.sample,
     topic: topics.sample,
     title: RandomData.random_sentence,
     body:  RandomData.random_paragraph
   )
 end
 posts = Post.all
 
 # Create Comments
 # #3
 100.times do
   Comment.create!(
 # #4
     post: posts.sample,
     body: RandomData.random_paragraph
   ) 
 end

#create advertisements 
  50.times do
 # #1
   Advertisement.create!(
 # #2
     price:  99,
     title:   RandomData.random_sentence
   )
 end
 @advertisements = Advertisement.all
 
 # Create Questions
 100.times do 
   Question.create!(
     title: RandomData.random_sentence,
     body: RandomData.random_paragraph,
     resolved: false
   )
 end 


unique_post = Post.find_or_create_by(title: "UNIQUE TITLE", body:  "UNIQUE BODY")
Comment.find_or_create_by(body:  "UNIQUE BODY", post: unique_post)
  
  user = User.first
 user.update_attributes!(
   email: 'dkt@bloc.com', 
   password: 'helloworld'
 )
  
 puts "Seed finished"
 puts "#{User.count} users created"
 puts "#{Topic.count} topics created!"
 puts "#{Post.count} posts created"
 puts "#{Comment.count} comments created"
 puts "#{Advertisement.count} advertisements created"
 puts "#{Question.count} questions created"