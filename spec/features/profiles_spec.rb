require 'rails_helper'

describe "Visiting profiles" do

  include TestFactories
  

  before do
    @user = authenticated_user
    @post = associated_post(user: @user)
    @comment = Comment.new(user: @user, post: @post, body: "A Comment")
    allow(@comment).to receive(:send_favorite_emails)
    @comment.save!
  end

  describe "not signed in" do

    it "shows profile" do
      visit user_path(@user)
      expect(current_path).to eq(user_path(@user))

       expect( page ).to have_content(@user.name)
       expect( page ).to have_content(@post.title)
       expect( page ).to have_content(@comment.body)
    end

  end

  describe "signed in" do

    include Warden 
    before do
    @user = authenticated_user
    login_as(@user, :scope => :user)
    @post = associated_post(user: @user)
    @comment = Comment.new(user: @user, post: @post, body: "A Comment")
    allow(@comment).to receive(:send_favorite_emails)
    @comment.save!
    end 

    it "shows profile" do
      visit user_path(@user)
      expect(current_path).to eq(user_path(@user))

       expect( page ).to have_content(@user.name)
       expect( page ).to have_content(@post.title)
       expect( page ).to have_content(@comment.body)
    end

  end

#   The spec's expectations (inside the it block) should be identical to those for the "not signed in" case.

# The spec should have an additional before block in which @user is signed in before visiting their profile page.

# You should not need to make any changes outside of the spec folder.
# Do not use Devise::TestHelpers to sign in your user. They don't work in feature specs. Instead, read How To: Test with 
# Capybara and follow the instructions to include the test helpers from Warden, 
# the authentication framework on which Devise is built.
end