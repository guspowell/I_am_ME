class Event < ActiveRecord::Base

  belongs_to :calendar
  belongs_to :user
  has_many :taggings, dependent: :destroy
  has_many :tags, through: :taggings

  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

  def add_tag=(names)
    self.tags = names.split(",").map do |name|
      Tag.where(name: name.strip).first_or_create!
    end
  end
   
  def get_tags 
    self.tags.map(&:name).join(', ')
  end

end
