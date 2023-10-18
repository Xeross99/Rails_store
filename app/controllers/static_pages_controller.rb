class StaticPagesController < ApplicationController
  skip_before_action :authorize
  
  #Przywołanie CurrentCart z app/models/concerns/current_cart.rb
  include CurrentCart
  before_action :set_cart
  
  def questions
  end

  def news
  end

  def contact
  end
end
