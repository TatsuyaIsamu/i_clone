module UsersHelper
  def choose_signup_or_edit
    if action_name == "new"
      return "新規投稿"
    else
      return "編集する"
    end
  end


end