module NotesHelper
  
  def greetings
    ["Dear", "Dear Sir or Madam,", "Hello", "Hi", "To Whom It May Concern,", ""]
  end
  
  def closings
    ["Sincerely,", "Sincerely Yours,",
     "Regards,", "Best Regards,", "Kind Regards,",
     "Yours,","Yours Truly,",
     "Thanks!","Thank you,","Thank you for your consideration,",
     "Respectfully,", "Respectfully Yours,", 
     ""]    
  end
  
  def guest_or_user_name
    current_user.name
  end

  def guest_or_user_street
    current_user.street
  end
  
  def guest_or_user_city
    current_user.city
  end
  
  def guest_or_user_state
    current_user.state
  end
  
  def guest_or_user_zip
    current_user.zip
  end
  
end
