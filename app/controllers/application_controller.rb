class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def calendar
    render 'layouts/calendar'
  end

  def documents
    render 'layouts/documents'
  end
end
