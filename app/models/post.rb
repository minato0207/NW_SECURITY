class Post < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :security

  validates  :title, :text, :security_id, presence: true

  belongs_to :user
  has_many :post_tag_relations,dependent: :destroy
  has_many :tags, through: :post_tag_relations
  has_many :comments
  has_many :favorites
  has_one_attached :image


 

  

  def self.search(search)
    if search != ""
      Post.where("security_id = #{search}")
    #  else
    #   puts 投稿がありません
    end
  end

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end 

  def self.posts_serach(search)
    Item.where(['title LIKE ? OR content LIKE ?', "%#{search}%", "%#{search}%"])
  end
 
  def save_posts(tags)
    current_tags = self.tags.pluck(:name) unless self.tags.nil?
    old_tags = current_tags - tags
    new_tags = tags - current_tags
 
    # Destroy
    old_tags.each do |old_name|
      self.tags.delete Tag.find_by(name:old_name)
    end
 
    # Create
    new_tags.each do |new_name|
      item_tag = Tag.find_or_create_by(name:new_name)
      self.tags << item_tag
    end
  end
 


end
