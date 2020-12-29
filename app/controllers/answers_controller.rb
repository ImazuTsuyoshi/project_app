class AnswersController < ApplicationController
  before_action :set_q, only: [:create, :edit, :update, :destroy]
  before_action :set_a, only: [:edit, :update, :destroy]

  def create
    #@question = Question.find(params[:question_id])
    @answer = Answer.new
    if @answer.update(answer_params)
      redirect_to question_path(@question), notice: 'Success!'
    else  
      redirect_to question_path(@question), alert: 'Invalid!'
    end    
  end  

  def edit
    #@question = Question.find(params[:question_id])
    #@answer = @question.answers.find(params[:id])
  end

  def update
    #@question = Question.find(params[:question_id])
    #@answer = @question.answers.find(params[:id])
    if @answer.update(answer_params)
      redirect_to question_path(@question), notice: 'Success!'
    else  
      flash[:alert] = 'Invalid!'
      render :edit
    end
  end  

  def destroy
    #@question = Question.find(params[:question_id])
    #@answer = @question.answers.find(params[:id])
    @answer.destroy
    redirect_to question_path(@question), notice: 'Deleted!'
  end  
    
    
  private
    def answer_params
      params.require(:answer).permit(:content, :name, :question_id)
    end  

    def set_q
      @question = Question.find(params[:question_id])
    end  

    def set_a
      @answer = @question.answers.find(params[:id])
    end  
end
