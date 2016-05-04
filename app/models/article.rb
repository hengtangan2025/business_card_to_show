class Article
  include Mongoid::Document
  include Mongoid::Timestamps

  # 标题
  field :title, type: String
  # 正文
  field :text_body, type: String
  # 图片
  field :picture, type: String
  # 作者
  # belongs_to :user

  validates :title, :text_body, presence: true
  
  # 排序
  scope :reversed, -> {order 'created_at DESC'}

end