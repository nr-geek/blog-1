class HomeController < ApplicationController
  before_action do
    prepend_view_path(Dir[Rails.root.join("app/javascript/packs/**/")])
  end

  def index
    session[:times_here] ||= 0
    session[:times_here] += 1
    Rails.logger.info params.inspect
    params[:hello]
  end
end
