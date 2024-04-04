class FollowRequestsController < ApplicationController
  before_action :authenticate_user!

  def index
    @sent_follow_requests = FollowRequest.where(sender_id: current_user.id, accepted: false).includes(:receiver)
    @received_follow_requests = FollowRequest.where(receiver_id: current_user.id, accepted: false).includes(:sender)
  end

  def new
    @request = FollowRequest.new
  end

  def create
    receiver = User.find_by(email: params[:follow_request][:receiver_email])
    if receiver.nil?
      @error_message = "User with email '#{params[:follow_request][:receiver_email]}' not found"
      @request = FollowRequest.new
      render :new, status: :unprocessable_entity
    elsif request_existed(receiver.id, current_user.id)
      @error_message = "Request already existed"
      @request = FollowRequest.new
      render :new, status: :unprocessable_entity
    else
      @request = current_user.sent_follow_requests.build(receiver_id: receiver.id)

      respond_to do |format|
        if @request.save
          if !params[:follow_request][:from_users]
            format.turbo_stream 
          else
            redirect_to users_path
          end
        else
          format.html { render :new, status: :unprocessable_entity }
        end
      end
    end
  end

  def destroy
    @request = FollowRequest.find(params[:id])
    @request.destroy

    flash[:notice] = "Removed follow request"
    redirect_to follow_requests_path
  end

  def accept
    @request = FollowRequest.find(params[:id])
    if current_user == @request.receiver
      @request.accepted = true
      if @request.save
        flash[:notice] = 'Request accepted!'
      else
        flash[:error] = "Failed to accept request."
      end
    end
    redirect_to follow_requests_path
  end

  private

  def follow_request_params
    params.require(:follow_request).permit(:sender_id, :receiver_id, :receiver_email)
  end

  def request_existed(receiver_id, sender_id)
    request = FollowRequest.find_by(receiver_id: receiver_id, sender_id: sender_id)
    return !request.nil?
  end
end
