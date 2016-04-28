class BusinessCard
  include Mongoid::Document
  include Mongoid::Timestamps

  field :name, :type => String
  field :qq_code, :type => String
  field :we_chat_code, :type => String
  field :introduction, :type => String
  field :qr_image_url, :type => String
  field :phone_number, :type  => String
  field :mail, :type  => String
  field :company, :type  => String
  field :head_url, :type  => String
  belongs_to :user
end