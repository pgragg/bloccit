module TestFactories
  
  def associated_post(options={})
    post_options = {
      title: 'Post titles can be short',
      body: 'Post bodies must be pretty long AND I am not sure why not working',
      topic: Topic.create(name: 'Topic'),
      user: authenticated_user
    }.merge(options)
    post = Post.create(post_options)
    post
  end 
  def authenticated_user(options={})
    user_options = {email: "email#{rand}@fake.com", password: 'password', role: 'admin'}.merge(options)
    user = User.new(user_options)
    user.skip_confirmation!
    user.save
    user
  end


end 

  
  
  