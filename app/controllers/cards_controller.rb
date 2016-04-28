class CardsController < ApplicationController
  include SessionsHelper
  def new
    @card = Card.new
  end

  def create
    require 'fileutils'
    head_file = params[:card][:head_file]
    we_chat_file = params[:card][:we_chat_file]

    head_file_path = File.join("public", head_file.original_filename)
    we_chat_file_path = File.join("public", we_chat_file.original_filename)

    FileUtils.cp head_file.path, head_file_path
    FileUtils.cp we_chat_file.path, we_chat_file_path

    user = User.find(current_user)
    card = Card.new(:head_url=>head_file.original_filename,:qr_img_url=>we_chat_file.original_filename,:user_id=>user.id)
    card.update(create_cards_params)
    if card.save
      redirect_to "/cards"
    end
  end

  def index
    @cards = Card.all
  end

  def show
    @card = Card.find(params[:id])
  end

  private
    def create_cards_params
      params.require(:card).permit(:name, :qq_code, :we_chat_code, :introduction, :phone_num, :mail, :company)
    end
end