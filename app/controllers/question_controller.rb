class QuestionController < ApplicationController
  
  def index
    @questions = Question.all
  end

  def show
    @question = Question.find(params[:id])
  end

  def new
    @question = Question.new
  end

  def create
     @question = Question.new
     @question.title = params[:question][:title]
     @question.body = params[:question][:body]
     if @question.save
       flash[:notice] = "question was saved."
       redirect_to @question
     else
       flash.now[:alert] = "There was an error saving the question. Please try again."
       render :new
     end
  end

  def edit
    @question = Question.find(params[:id])
  end
  
    def update
     @question = Question.find(params[:id])
     @question.title = params[:question][:title]
     @question.body = params[:question][:body]
 
     if @question.save
       flash[:notice] = "question was updated."
       redirect_to @question
     else
       flash.now[:alert] = "There was an error saving the question. Please try again."
       render :edit
     end
    end
    
    def destroy
     @question = Question.find(params[:id])
 
 # #8
     if @question.destroy
       flash[:notice] = "\"#{@question.title}\" was deleted successfully."
       redirect_to question_path
     else
       flash.now[:alert] = "There was an error deleting the question."
       render :show
     end
    end
end
