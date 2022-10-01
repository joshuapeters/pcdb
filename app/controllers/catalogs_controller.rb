class CatalogsController < ApplicationController
  def get
    redirect_to login_path unless logged_in?
    @catalogs = []
  end
end
