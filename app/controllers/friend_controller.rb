class FriendController < ApplicationController
  
  def add_friend
  	fri = Friend.find(params[:id])
  	fri.status = 1
  	first = fri.f2_username
  	second = fri.f1_username

  	if fri.save 
  		frit = Friend.where('f1_username LIKE ? AND f2_username LIKE ?', "%#{first}%", "%#{second}%").update_all(status: 2)
    	redirect_to current_user
    end
  end

  def confirm
  	if Friend.where('f1_username LIKE ? OR f2_username LIKE ?', "%#{params[:f1]}%", "%#{params[:f2]}%").limit(1).update_all(status: 3)
  	   flash[:success] = "Friend list updated"
    else
        flash[:danger] = "Some error occurs in making your Friend"
    end
    # fri.status = 3
  	first = params[:f2]
  	second = params[:f1]

  	# if fri.save 
  	if Friend.where('f1_username LIKE ? OR f2_username LIKE ?', "%#{first}%", "%#{second}%").limit(1).update_all(status: 3)
       flash[:success] = "Friend list updated"
    else
        flash[:danger] = "Some error occurs in making your Friend"
    end
    redirect_to current_user
  end

end
