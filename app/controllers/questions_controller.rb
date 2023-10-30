class QuestionsController < ApplicationController

    before_action :set_default_score, only: [:index]
  
    # トップページから最初の質問にリダイレクト
    def index
      @question = Question.first
      redirect_to question_path(@question)
    end
  
    # 質問を表示
    def show
      @question = Question.find(params[:id])
    end
  
    # ユーザーの回答を処理し、次の質問にリダイレクトまたは結果ページにリダイレクト
    def update
      @question = Question.find(params[:id])
      
      if params[:option_id]
        option = Option.find(params[:option_id])
        if option.correct?
          session[:score] += 1
        end
      end
  
      if @question == Question.last
        redirect_to questions_result_path
      else
        redirect_to question_path(@question.next) # .nextは次の質問を取得するメソッドと仮定
      end
    end
  
    # クイズの結果を表示
    def result
      @score = session[:score]
      # セッションをリセットして次回のクイズのためにスコアをクリア
      session[:score] = nil
    end
  
    private
  
    # スコアのデフォルト値をセット
    def set_default_score
      session[:score] ||= 0
    end
end  
