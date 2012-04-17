class HomeController < ApplicationController
  
  before_filter :setar_classe_menu
  
  def index
    #Collection estatistcs
    @pessoas = Pessoa.all
  end  
  
  private

  def setar_classe_menu
    @class_home = 'active'  
  end
  
end