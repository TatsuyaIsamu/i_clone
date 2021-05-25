module PicturesHelper

  def admin
     current_user.id == @picture.user_id
  end
 
  
end