require "digest/sha1"

class AdminController < ApplicationController
  include AuthenticatedSystem
  before_filter :login_required
  
  def index
    @apps = App.all
  end
  
  def new
    @app = App.new
  end
  
  def create
    @app = App.new(params[:app])
    if @app and @app.save
      flash[:notice] = "App '#{@app.name}' created"
      redirect_to :action => "index"
    else
      render :action => "new"
    end
  end
  
  def edit
    @app = App.find(params[:id])
  end
  
  def update
    @app = App.find(params[:id])
    if @app.update_attributes(params[:app])    
        flash[:notice] = "App '#{@app.name}' updated"
        redirect_to :action => "index"
      else
        render :action => "edit"
    end
  end  
end
