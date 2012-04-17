# encoding : utf-8
class PessoasController < ApplicationController

  respond_to :html
  before_filter :setar_classe_menu
  before_filter :manage_params, :only => [:index]
  before_filter :load_pessoa , :only => [:show, :edit, :update, :destroy]

  def index
    @pessoa = Pessoa.new(params[:pessoa])
    @pessoas = Pessoa.pesquisar(params[:pessoa],params[:page])
    respond_with @pessoas
  end

  def show
    respond_with @pessoa
  end

  def new
    load_combos
    @pessoa = Pessoa.new
    respond_with @pessoa
  end

  def edit
    load_combos
  end

  def create
    @pessoa = Pessoa.new(params[:pessoa])
    
    if @pessoa.save
      flash[:notice] = t('msg.create_sucess')
      redirect_to pessoas_path
    else
      load_combos
      render :action => :new 
    end
     
  end

  def update
    if @pessoa.update_attributes(params[:pessoa])
      flash[:notice] = t('msg.update_sucess')
      redirect_to pessoas_path
    else
      load_combos
      render :action => :edit
    end
  end

  def destroy
    @pessoa.destroy
    flash[:notice] = t('msg.destroy_sucess')
    redirect_to pessoas_path
  end
  
  private
  
  def setar_classe_menu
    @class_pessoa = 'active'  
  end
  
  def load_pessoa
    @pessoa = Pessoa.new(params[:pessoa])
  end
  
  def load_combos 
    #Collections
  end
  
  def manage_params
    if (!params[:pessoa].nil?) 
       params[:pessoa].delete_if{|k,v| v.blank?}
    end
  end
  
end
