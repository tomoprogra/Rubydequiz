class QuestionsController < ApplicationController
    before_action :set_default_score, only: [:by_level]
    before_action :set_question, only: [:show, :update]
  
    def top
      session[:current_question_index] = 0
    end
  
    def show
    end
  
    def update
        if params[:answer].blank?
            flash.now[:error] = "選択してください"
            render :show
            return
          end          
  
      option = Option.find(params[:answer])
      session[:score] += 1 if option.correct?
      session[:current_question_index] += 1
  
      if next_question = Question.where(level: @question.level).offset(session[:current_question_index]).first
        redirect_to question_path(next_question)
      else
        redirect_to result_questions_path(level: @question.level)
      end
    end
  
    def by_level
      level = params[:level]
      session[:current_question_index] = 0 if params[:reset]
  
      @question = Question.where(level: level).offset(session[:current_question_index]).first
  
      if @question.nil?
        redirect_to result_path
        return
      end
  
      render :show
    end   
      
    def result
      @level = params[:level]
      @score = session[:score] || 0
      @questions = Question.all
  
      @comment = case @score
                 when 5
                   "完璧！全問正解です！素晴らしい成果ですね！"
                 when 4
                   "すごい!5問中4問正解!次は全問正解を目指しましょう!"
                 when 3
                   "良い成果です!5問中3問正解!次回はさらに上を目指しましょう!"
                 when 2
                   "2問正解!次回はさらに多くの問題に挑戦してみましょう!学び続けることが大切です！"
                 when 1
                   "1問正解!挑戦することは学びの第一歩です!次回はさらに良い結果を目指しましょう!"
                 else
                   "今回は難しかったかもしれませんが、挑戦すること自体が素晴らしいです!再挑戦して、学びを深めましょう!"
                 end
  
      session[:score] = nil
    end
  
    def explanation
      @question = Question.find(params[:id])
    end
  
    private
  
    def set_question
      @question = Question.find_by(id: params[:id])
      unless @question
        flash[:error] = "該当する質問が見つかりません"
        redirect_to root_path
      end
    end
  
    def set_default_score
      session[:score] ||= 0
    end
  end
  