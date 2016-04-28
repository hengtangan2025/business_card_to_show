class Engine < ::Rails::Engine
  config.to_prepare do
    ApplicationController.helper ::ApplicationHelper

    Dir.glob(Rails.root + "app/decorators/**/*_decorator.rb").each do |c|
      require_dependency(c)
    end

    User.class_eval do
      has_many :articles , class_name: "Article"
      has_one :business_card , class_name: "BusinessCard"
    end
  end
end