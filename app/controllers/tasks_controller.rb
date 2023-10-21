class TasksController < ApplicationController
    before_action :authenticate_user!
  
    def index
      if params[:show_all] == 'true'
        @tasks = Task.all
      else
        @tasks = current_user.tasks
      end
    end
  end
  