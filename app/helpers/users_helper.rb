module UsersHelper

    def summary_submitted?(user,occurrence)
        summary = Attendee.where("user_id = ? AND occurrence_id = ?",user.id,occurrence.id).first
        if summary != nil
            true
       # else if summary == nil
        else
            false
        end
    end
  
end
