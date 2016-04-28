class Message
  include Mongoid::Document
  include Mongoid::Timestamps
  field :name, :type => String
  field :phone_num, :type => String
  field :context, :type => String
  belongs_to :user

end