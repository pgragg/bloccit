class Post < ActiveRecord::Base
  has_many :comments, dependent: :destroy
  has_one :summary, dependent: :destroy 
  belongs_to :user
  belongs_to :topic

  validates :title, length: { minimum: 5 }, presence: true
  validates :body, length: { minimum: 20 }, presence: true
  validates :topic, presence: true #This is throwing an error, which is odd.
  validates :user, presence: true


  default_scope { order('created_at DESC') }
  scope :ordered_by_reverse_created_at, -> { order('created_at ASC') }
  scope :ordered_by_title,              -> { order('title ASC') }

  def markdown_title
    render_as_markdown(title)
  end

  def markdown_body
    render_as_markdown(body)
  end

  private 

  def render_as_markdown(markdown)
    renderer = Redcarpet::Render::HTML.new
    extensions = {fenced_code_blocks: true}
    redcarpet = Redcarpet::Markdown.new(renderer, extensions)
    (redcarpet.render markdown).html_safe
  end 
end

# Add Post#markdown_title and Post#markdown_body to Post:

# Create a private Post#render_as_markdown method that markdown_title and markdown_body can call. This will keep the markdown_title and markdown_body DRY.

# Remove the markdown_to_html method from application_helper.rb.

# Update your views to use the Post#markdown_title and Post#markdown_body methods.



#There are numerous types of validations. The most common are presence, length, and format. Formatting usually requires a Regex, which is an advanced topic that will be covered later. Here's the Rails Guide on validations - it's a good reference.