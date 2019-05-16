# frozen_string_literal: true

class RegistrationsController < Devise::RegistrationsController
  protected

  def after_sign_in_path_for(_resource)
    root_path
  end

  private

  def sign_up_params
    allow = %i[email first_name last_name password password_confirmation]
    params.require(resource_name).permit(allow)
  end

  def account_update_params
    allow = %i[email first_name last_name password password_confirmation current_password]
    params.require(resource_name).permit(allow)
  end
end
