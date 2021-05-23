class HomeController < ApplicationController
  def top
    @pictures = Picture.all
  end
end
