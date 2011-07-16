module NotesHelper
  def greeting_names(recipient)
    ["#{recipient.name}", "#{recipient.first_name}", "Mr. #{recipient.last_name}", "Mrs. #{recipient.last_name}", ""]
  end
  
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
  
  def signatures
    [current_user.name, current_user.first_name, 
     "Mr. #{current_user.last_name}", "Mrs. #{current_user.last_name}"
    ]
  end
  
  
end
