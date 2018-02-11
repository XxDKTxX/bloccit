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
 
 puts "creating custom post"
Post.find_or_create_by!(title: "custom post", body: "custom body")
 puts "creating custom comment"
Comment.find_or_create_by!(post: "custom post", body: "custom comment")
  
  
 puts "Seed finished"
 puts "#{Post.count} posts created"
 puts "#{Comment.count} comments created"