class Article
  include Mongoid::Document
  include Mongoid::Timestamps

  # 标题
  field :title, type: String
  # 正文
  field :text_body, type: String
  # 图片
  field :picture, type: String

  belongs_to :user
end