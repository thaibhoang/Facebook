class HangoutsController < ApplicationController
  def index
    @message = Message.new
    @messages = Message.order(created_at: :desc).limit(100).includes(:user)
  end
end
