class MainController < ApplicationController

  def index
    require_user
  end

end
