class FriendController < ApplicationController
  
  def add_friend
  	fri = Friend.find(params[:id])
  	fri.status = 1
  	first = fri.f2_username
  	second = fri.f1_username

  	if fri.save 
  		@frit = Friend.where('f1_username LIKE ? OR f2_username LIKE ?', "%#{first}%", "%#{second}%")
    	done = false
      @frit.each do |data|
        data.status = 2
        done = true
      end
      if done
    		redirect_to current_user
    	end
    end
  end

  def confirm
  	fri = Friend.find(params[:id])
  	fri.status = 3
  	first = fri.f2_username
  	second = fri.f1_username

  	if fri.save 
  		@frit = Friend.where(:all, :conditions => ['f1_username LIKE ? OR f2_username LIKE ?', "%#{first}%", "%#{second}%"])
    	done = false
      @frit.each do |data|
        data.status = 3
        done = true
      end
      if done
    		redirect_to current_user
    	end
    end
  end

end
