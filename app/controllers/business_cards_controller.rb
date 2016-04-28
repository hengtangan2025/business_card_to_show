class BusinessCardsController < ApplicationController
  def index
    @business_card = {
      :name => "李俊锋",
      :qq_code => "1684795230",
      :we_chat_code => "ljf15642",
      :head_url => "14-1604061041050-L.jpg",
      :phone_number => "1593624645",
      :company => "闹归闹基金会",
      :mail => "ljf@ngn.com",
      :introduction => "闹归闹",
      :qr_image_url => "闹归闹.png"
    }
  end
end