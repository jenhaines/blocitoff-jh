class TodosController < ApplicationController

	before_action :authenticate_user!
	
	def new
		@todo = Todo.new
	end

	def create
		@todo = current_user.todos.new(todo_params)
		if @todo.save
			redirect_to todos_path, notice: 'Your new TODO was saved'
		else
			flash[:error] = 'Please fill in the todo description'
			render :new
		end
	end

	def show
		@todo = Todo.find params[:id]
	end

	def index
		@user = current_user
		@todos = @user.todos
	end


	private
 
   def todo_params
     params.require(:todo).permit(:description)
   end
end