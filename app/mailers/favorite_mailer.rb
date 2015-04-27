class FavoriteMailer < ApplicationMailer
  default from: "pipergragg@gmail.com"
  include SendGrid  

  def new_comment(user, post, comment)
 
     # New Headers
     headers["Message-ID"] = "<comments/#{comment.id}@your-app-name.example>"
     headers["In-Reply-To"] = "<post/#{post.id}@your-app-name.example>"
     headers["References"] = "<post/#{post.id}@your-app-name.example>"
 
     @user = user
     @post = post
     @comment = comment
 
     mail(to: user.email, subject: "New comment on #{post.title}")
   end
end

# ActionMailer follows a similar pattern to Rails controllers: 
# You can define instance variables that will be available to your "view" - 
# the content sent in the email.