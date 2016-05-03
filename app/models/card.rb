class Card
  include Mongoid::Document
  include Mongoid::Timestamps

  # 昵称
  field :name, :type => String
  # qq号
  field :qq_code, :type => String
  # 微信号
  field :we_chat_code, :type => String
  # 简介 
  field :introduction, :type => String
  # 二维码 图片url
  field :qr_img_url, :type => String
  # 手机号
  field :phone_num, :type => String
  # 邮箱
  field :mail, :type => String
  # 企业
  field :company, :type => String
  # 头像url
  field :head_url, :type => String

  belongs_to :user
end