class RegistrationsController < Devise::RegistrationsController
  private
  def sign_up_params
    params.require(:user).permit(
      :name, :email, :password, :password_confirmation, :institute_id,
      :branch_id, :degree_id
    )
  end

  def account_update_params
    params.require(:user).permit(
      :name, :email, :password, :password_confirmation, :institute_id,
      :branch_id, :degree_id
    )
  end
end
