class Post < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :security

  validates  :title, :text, :security_id, presence: true

  belongs_to :user

  has_many :post_tag_relations
  has_many :tags, through: :post_tag_relations


  def self.search(search)
    if search != ""
      Post.where("security_id = #{search}")
    #  else
    #   puts 投稿がありません
    end
  end

end
