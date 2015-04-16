module ViewHelper 
# def will_paginate(collection) 

# #params[:offset] is a way to access offset which is not included in this ruby file. Offset is a param passed into the URL. 
#   def nav_bar(page,thing)
#     n = @items/PER_PAGE 
#     i = 1
#     content_tag(:nav) do
#       content_tag(:ul, :class => "pagination") do
#         content_tag(:li) do
#             link_to('<<', "?offset=#{params[:offset].to_i-PER_PAGE}") 
#         end 

#         n.times do 
#           content_tag(:li) do 
#             link_to("#{i} WTF", "#{i.to_s}",)
#             i += 1 
#           end
#         end

#         content_tag(:li) do 
#             link_to('>>', "?offset=#{params[:offset].to_i+PER_PAGE}")
#         end
#        end
#      end
#    end

 

# #   <nav>
# #   <ul class="pagination">
# #     <li>
# #       <a href="#" aria-label="Previous">
# #         <span aria-hidden="true">&laquo;</span>
# #       </a>
# #     </li>
# #     <li><a href="#">1</a></li>
# #     <li><a href="#">2</a></li>
# #     <li><a href="#">3</a></li>
# #     <li><a href="#">4</a></li>
# #     <li><a href="#">5</a></li>
# #     <li>
# #       <a href="#" aria-label="Next">
# #         <span aria-hidden="true">&raquo;</span>
# #       </a>
# #     </li>
# #   </ul>
# # </nav>

#   # 

#   #Takes current page number 
#   #Spits out HTML for Prev, 1, 2, 3, Next
#   return (nav_bar(@current_page, collection)).html_safe

# end 

# def paginate(hash)
#   page = hash[:page] # Or any page number (starts at 0)
#   per_page = hash[:per_page]
#   Resource.limit(per_page).offset(page * per_page)
 # end 

end 




# # Add a will_paginate view helper method that takes a collection and generates the HTML to link between them.
# #will_paginate @topics 