class ApplicationController < ActionController::Base

  before_action :get_categories

  private

  def get_categories
    @categories = Category.all
  end
end
