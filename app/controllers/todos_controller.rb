
class TodosController < ApplicationController
  def index
      @todo_items = Todo.all
       @new_todo = Todo.new 
  end


  def delete
   #put delete logic here
  end


def add
   
   
   todo = Todo.create(:todo_item => params[:todo][:todo_item])
   
   if !todo.valid?
        flash[:error] = todo.errors.full_messages.join("<br>").html_safe
    
    else
     flash[:success] = "Todo added successfully"  

   end
   redirect_to :action => 'index'
end


def complete
    params[:todos_checkbox].each do |check|
       todo_id = check
       t = Todo.find_by_id(todo_id)
       #code to update the status here
     end
    redirect_to :action => 'index'
 end

end