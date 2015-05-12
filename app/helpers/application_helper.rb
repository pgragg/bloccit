module ApplicationHelper
  def my_name 
    "Piper Gragg"
  end 
   def form_group_tag(errors, &block)
     if errors.any?
       content_tag :div, capture(&block), class: 'form-group has-error'
     else
       content_tag :div, capture(&block), class: 'form-group'
     end
   end

   def up_vote_link_classes(post)
      classes = "glyphicon glyphicon-chevron-up "
      classes += "voted" if current_user.voted(post) && current_user.voted(post).up_vote?
      classes 
   end 

   def down_vote_link_classes(post)
    classes = "glyphicon glyphicon-chevron-down "
    classes += "voted" if current_user.voted(post) && current_user.voted(post).down_vote?
    classes 
   end 

end

#&block is a proc object. 
# Helpers are in Ruby and often return HTML. 
# The content_tag is one such method, which takes a symbol argument, a block, and an options hash. 
# It then creates the symbol-specified HTML tag with the block contents 
# (and, if specified, the options).