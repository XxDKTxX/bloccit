require 'random_data'

 # Create Posts
 50.times do
 # #1
   Post.create!(
 # #2
     title:  RandomData.random_sentence,
     body:   RandomData.random_paragraph
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


unique_post = Post.find_or_create_by(title: "UNIQUE TITLE", body:  "UNIQUE BODY")
Comment.find_or_create_by(body:  "UNIQUE BODY", post: unique_post)
  
  
 puts "Seed finished"
 puts "#{Post.count} posts created"
 puts "#{Comment.count} comments created"
 puts "#{Advertisement.count} advertisements created"