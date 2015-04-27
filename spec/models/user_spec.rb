 require 'rails_helper'
 
 describe User do
 
   include TestFactories

   # def favorited(post)
   #  favorites.where(post_id: post.id).first
   # end
 
   describe "#favorited(post)" do
    before do
       post = Post.new
       user = User.new(role: "admin")
    end

     it "returns `nil` if the user has not favorited the post" do
     end
 
     it "returns the appropriate favorite if it exists" do

     end

     it "returns `nil` if the user has favorited another post" do
      
     end

   end
 end