module ViewHelper 
def will_paginate(collection) #Believe it or not, this behemoth works. Unfortunately, it has a face only a mother could love. 
  n = 1
  html = '' 
  while n <= collection.count/collection.per_page 
    html += '<li><a href="?page='
    html += n.to_s
    html += '">'
    html += n.to_s
    html += '</a></li>'
    n += 1 
  end 
  #The below behemoth doesn't even work. 
  prev_button = '<nav> 
  <ul class="pagination"> 
  <li> 
  <a href="?page='
  prev_page = :page
  after_prev_button = '" aria-label="Previous">
        <span aria-hidden="true">&laquo;</span>
      </a>
    </li>' 
  next_button = ' <li>
      <a href="?page='
  next_page = #collection.page+1 doesn't work... :( 
  after_next_button = '" aria-label="Next">
        <span aria-hidden="true">&raquo;</span>
      </a>
    </li>
  </ul>
</nav>'
  #Takes current page number 
  #Spits out HTML for Prev, 1, 2, 3, Next
  return (prev_button+prev_page.to_s+after_prev_button + html + next_button+next_page.to_s+after_next_button).html_safe

end 
end 




# Add a will_paginate view helper method that takes a collection and generates the HTML to link between them.
#will_paginate @topics 