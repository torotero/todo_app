class TodosController < ApplicationController
  def index
  	# @todo_items = "buying a milk"
	# @todo_array = ["buying milk","buying soap","Pay Internet bill","Go to Mall"]
	@todo_items = Todo.all
	@new_todo =Todo.new
	# render :index
	# render :nothing => true

  end

  def add
  		# todo = Todo.create(:todo_item => params[:todo_text])
  		todo = Todo.create(:todo_item => params[:todo][:todo_item])
  		# To handle the data from form_for inside the controller, the params variable is in the form of params[:name of the model][:name of the input field]
  		

  		
  		# redirect_to :action => 'index'

  		if !todo.valid?
  			flash[:error] = todo.errors.full_messages.join("<br>").html_safe
  		else
  			flash[:success] = "todo added successfully"
  		end




  		redirect_to index_path
  end

  def mark
  end

  def unmark
  end

  def delete
  	  @last = Todo.last
      @last.delete
      @last.save
  end


  def complete
      params[:todos_checkbox].each do |check|
         todo_id = check
         t= Todo.find_by_id (todo_id)


         t.update_attribute(:completed,true)

      end

      redirect_to :action => 'index'
  end

end
