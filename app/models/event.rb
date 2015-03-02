class Event < ActiveRecord::Base


  belongs_to :calendar
  belongs_to :user
  has_many :taggings
  has_many :tags, through: :taggings


  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

  def add_tag(tag)
    self.tags << tag 
  end
   
  def get_tags 
    self.tags
  end

  def get_tags_as_strings
    self.tags.map {|tag| tag.name }
  end

end
