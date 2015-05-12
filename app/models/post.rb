class Post < ActiveRecord::Base


  has_many :comments, dependent: :destroy
  has_many :votes, dependent: :destroy 
  has_one :summary, dependent: :destroy 
  has_many :favorites, dependent: :destroy 
  belongs_to :user
  belongs_to :topic


  validates :title, length: { minimum: 5 }, presence: true
  validates :body, length: { minimum: 20 }, presence: true
  validates :topic, presence: true #This is throwing an error, which is odd.
  validates :user, presence: true


  #default_scope { order('created_at DESC') }
  default_scope { order('rank ASC') } #Highest ranked posts go first
  scope :ordered_by_reverse_created_at, -> { order('created_at ASC') }
  scope :ordered_by_title,              -> { order('title ASC') }

  mount_uploader :image, ImageUploader



  def markdown_title
    render_as_markdown(title)
  end

  def markdown_body
    render_as_markdown(body)
  end

  def up_votes
    votes.where(value: 1).count
  end

  def down_votes
    votes.where(value: -1).count
  end

  def points
    up_votes - down_votes 
  end

  def age
    age_in_days = (self.created_at - Time.new(1970,1,1)) / (60 * 60 * 24) # 1 day in seconds
  end 

  def update_rank
   
   new_rank = points - age/1000  #Higher ranked posts go first. This ranking makes no sense.
   update_attribute(:rank, new_rank)
  end

  def create_vote
    user.votes.create(post: self, value: 1)
  end 

  def save_with_initial_vote
    ActiveRecord::Base.transaction do
       self.create_vote
       self.save
    end 
  end 


  private 
  
  def render_as_markdown(markdown)
    renderer = Redcarpet::Render::HTML.new
    extensions = {fenced_code_blocks: true}
    redcarpet = Redcarpet::Markdown.new(renderer, extensions)
    (redcarpet.render markdown).html_safe
  end 
end



#There are numerous types of validations. The most common are presence, length, and format. Formatting usually requires a Regex, which is an advanced topic that will be covered later. Here's the Rails Guide on validations - it's a good reference.