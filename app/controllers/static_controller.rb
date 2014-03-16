class StaticController < ApplicationController
  def contact
    render 'contact'
  end
  def consulting
    render 'consulting'
  end
  def home
    render 'home'
  end
  def about
    render 'about'
  end
end
