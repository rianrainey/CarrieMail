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
    current_or_guest_user.name
  end

  def guest_or_user_street
    current_or_guest_user.street
  end
  
  def guest_or_user_city
    current_or_guest_user.city
  end
  
  def guest_or_user_state
    current_or_guest_user.state
  end
  
  def guest_or_user_zip
    current_or_guest_user.zip
  end
  
end
