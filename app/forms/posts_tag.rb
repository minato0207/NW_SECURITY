class PostsTag

  include ActiveModel::Model
  attr_accessor :text, :title, :name, :security_id, :user_id

  with_options presence: true do
    validates :text
    validates :title
    validates :name
  end

  def save
    tag = Tag.where(name: name).first_or_initialize
    tag.save
    
    post = Post.create(text: text, title: title, security_id: security_id, user_id: user_id)
  
    
    PostTagRelation.create(post_id: post.id, tag_id: tag.id)
  end

end