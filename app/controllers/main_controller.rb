class MainController < ApplicationController

  def index
  end
  
  def ranking
    @categories = Category.all.order( :code )
  end

end
