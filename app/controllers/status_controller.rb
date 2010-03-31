class StatusController < ApplicationController
  def index
    @apps = App.all(:include => :reports)
  end
end
