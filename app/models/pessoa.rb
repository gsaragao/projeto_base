class Pessoa < ActiveRecord::Base
  self.per_page = 10

  def self.pesquisar(obj, page)
    where(obj).paginate(:page => page).order("id desc")
  end
end
