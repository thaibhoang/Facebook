class MyRegistrationsController < Devise::RegistrationsController
  def create
    super
    if @user.persisted?
      UserMailer.sign_up(@user).deliver_now
    end
  end
end
