

def paginate(hash)
  page = hash[:page] # Or any page number (starts at 0)
  per_page = hash[:per_page]
  Resource.limit(per_page).offset(page * per_page)
end 


#@posts = @topic.posts.paginate(page: params[:page], per_page: 6)

# def login_success(name, hsh)
#   puts "User #{name} logged in with #{hsh[:some_hash_key]}"
# end
# And you can call it with

# login_success "username", :time => Time.now, :some_hash_key => "some text"
# But if the hash is not the last parameter you have to surround the hash elements with {}.
