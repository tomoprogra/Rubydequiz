class QuestionsController < ApplicationController
    before_action :set_default_score, only: [:index]
    before_action :set_question, only: [:show, :update]
    
    def top; end
  
    def show; end
  
    def update
        if params[:option_id].blank?
            flash[:error] = "選択してください" 
            render :show
            return
        end
      
        option = Option.find(params[:option_id])
        if option.correct?
          if session[:score]
            session[:score] += 1
          else
            session[:score] = 1
          end
        end
      
        if @question == Question.last
          redirect_to questions_result_path
        else
          redirect_to question_path(@question.next)
        end
      end
      
  
    def result
      @score = session[:score]|| 0
      @questions = Question.all

      case @score
      when 5
        @comment = "完璧！全問正解です！素晴らしい成果ですね！"
      when 4
        @comment = "すごい!5問中4問正解!次は全問正解を目指しましょう!"
      when 3
        @comment = "良い成果です!5問中3問正解!次回はさらに上を目指しましょう!"
      when 2
        @comment = "2問正解!次回はさらに多くの問題に挑戦してみましょう!学び続けることが大切です！"
      when 1
        @comment = "1問正解!挑戦することは学びの第一歩です!次回はさらに良い結果を目指しましょう!"
      else
        @comment = "今回は難しかったかもしれませんが、挑戦すること自体が素晴らしいです!再挑戦して、学びを深めましょう!"
    end
    session[:score] = nil
    
    end
    
    def explanation
      @question = Question.find(params[:id])
    end

    private
    
    def set_question
      if params[:id].present? && params[:id].to_i.to_s == params[:id]
        @question = Question.find_by(id: params[:id])
        unless @question
          flash[:error] = "該当する質問が見つかりません"
          redirect_to root_path and return
        end
      else
        flash[:error] = "不正なパラメータです"
        redirect_to root_path
      end
    end


    def set_default_score
      session[:score] ||= 0
    end
end
