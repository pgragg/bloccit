require 'rails_helper'

include TestFactories 
  describe Vote do 


    describe "validations" do 
      before do
       post = Post.new
       @invalid_vote = post.votes.build(value: 21) 
      end
 
 
      describe "value validation" do
        it "only allows -1 or 1 as values" do
          expect(@invalid_vote.valid?).to eq(false)
        end
      end 

      describe 'after_save' do
       it "calls `Post#update_rank` after save" do
         post = associated_post
         vote = Vote.new(value: 1, post: post)
         expect(post).to receive(:update_rank)
         vote.save
       end
     end
    end
  end

  # Specifically, in our vote_spec, we'll test that each vote sends a 
  #Post#update_rank "message" when saved, 
  #but not how that Post#update_rank method works, 
  #or how a vote is responsible for sending that message to its post.
