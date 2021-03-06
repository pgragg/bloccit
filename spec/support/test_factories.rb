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
  def valid_topic(options={})
    topic_options = {
      name: 'Topic titles can be short',
      description: 'Topic bodies must be pretty long AND I am not sure why not working',
    }.merge(options)
    topic = Topic.create(topic_options)
    topic
  end 
  def authenticated_user(options={})
    user_options = {email: "email#{rand}@fake.com", password: 'password', role: 'admin'}.merge(options)
    user = User.new(user_options)
    user.skip_confirmation!
    user.save
    user
  end


end 

module Warden #Won't work with controller tests because it isn't run for controllers. 
  include Warden::Test::Helpers
  Warden.test_mode!
  RSpec.configure do |config|
    config.after :each do
      Warden.test_reset!
    end
  end
end 

  
  
  