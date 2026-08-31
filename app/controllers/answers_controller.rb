class AnswersController < ApplicationController
  CORRECT_ANSWER = "trustyourcode"

  def new
  end

  def create
    normalized = params[:answer].to_s.downcase.gsub(/[^a-z]/, "")

    if normalized == CORRECT_ANSWER
      flash[:notice] = "🎉 脱出成功!コードをしっかり読めましたね。"
    else
      flash[:alert] = "❌ 惜しい、違います。もう一度コードを読み直してみましょう。"
    end

    redirect_to new_answer_path
  end
end
