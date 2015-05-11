 require 'rails_helper'
 
 describe Comment do
 
   include TestFactories
 
   describe "after_create" do
 
     before do
       @post = associated_post
       @user = authenticated_user(email_favorites: true)
       @other_user = authenticated_user
       @comment = Comment.new(body: 'My comment is really great', post: @post, user: @other_user)
     end
 
     it "sends an email to users who have favorited the post" do
       favorite = @user.favorites.create(post: @post)
 
       allow( FavoriteMailer ) #Sets up the mock. Allow really means "create this mock."
         .to receive(:new_comment) #Mocking, not stubbing. Defines what method we're looking for. 
         .with(@user, @post, @comment) #Looks for parameters to be passed to new_comment. 
         .and_return( double(deliver_now: true) ) #Looks for parameters to be passed to new_comment.
          #Why are we using a double here? Doubles are used just for testing. 
         expect( FavoriteMailer )
           .to receive(:new_comment)
 
       @comment.save
     end
 
     it "does not send emails to users who haven't" do
       expect( FavoriteMailer )
         .not_to receive(:new_comment)
 
       @comment.save
     end
   end
 end