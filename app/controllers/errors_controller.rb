# frozen_string_literal: true

class ErrorsController < ActionController::Base
  def show
    @header     = I18n.t("error.header_#{status_code}")
    @message    = I18n.t("error.message_#{status_code}")
    @html_title = "#{@message} (#{status_code})"
    render 'errors/error', status: status_code
  end

  protected

  def status_code
    params[:status_code] || 500
  end
end
