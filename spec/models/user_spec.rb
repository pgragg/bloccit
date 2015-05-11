 require 'rails_helper'
 
 describe User do
 
   include TestFactories

   # def favorited(post)
   #  favorites.where(post_id: post.id).first
   # end
 
   describe "#favorited(post)" do
    before do
       @post = associated_post
       @user = authenticated_user
       @other_post = associated_post
    end

     it "returns `nil` if the user has not favorited the post" do
      expect(@user.favorited(@post)).to be_nil #Should is deprecated, but expect and .to were not working with nil objects. 
     end
 
     it "returns the appropriate favorite if it exists" do
      favorite = Favorite.create(post_id: @post.id, user_id: @user.id)
      expect(@user.favorited(@post)).to eq(favorite)
     end

     it "returns `nil` if the user has favorited another post" do
       favorite = Favorite.create(post_id: @other_post.id, user_id: @user.id)
       expect(@user.favorited(@post)).to be_nil
     end

   end
 end