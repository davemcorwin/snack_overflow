# I typically use the exception throwing version of the create methods (!)
# so i'll know right away if there is a problem. They also return the created
# model instead of a boolean.

# Only run seeds in development
if Rails.env.development?

  # Destroy all the records before loading new data
  %w(Answer Question User).each { |table| table.constantize.destroy_all }

  ## Protip!
  ## This syntax is cool, if I have a array of strings I can use the above syntax
  ## instead of the typical ['Answer', 'Question'] syntax.

  ## Protip!
  ## I am also using the 'constantize' method which takes a string and looks for
  ## a ruby object of that that class. Ex. 'String'.constantize would give you the String class.

  # Create some users
  dave,
  todd,
  mary = %w(dave todd mary).map do |name|
    User.create!(email: "#{name}@snackoverflow.com", password: "password")
  end

  ## Protip!
  ## I can magically unpack the array returned into individual variables!

  # Create some questions
  oreo_question,
  triscuit_question,
  girlfriend_question = Question.create!([
    {
      user:        dave,
      title:       "My oreo cookies keep breaking!",
      description: "I keep trying to remove the cookies from the oreo so I can eat the filling by itself in all it's glory, but I keep breaking the cookies! Can anyone help me solve this mystery?"
    },
    {
      user:        dave,
      title:       "The best topping for Black Pepper Triscuits",
      description: "Does anyone have a suggestion for the best topping for Black Pepper Triscuits? I am really enjoying CoJack cheese right now, but it feels like there could be something even better out there."
    },
    {
      user:        todd,
      title:       "Bugles?",
      description: "My girlfriend loves Bugles, but I can't find them anywhere, do they still exist??"
    }
  ])

  ## Protip!
  ## I can create multiple models by send 'create' an array!

  # Answer some questions
  Answer.create!([
    {
      question:    oreo_question,
      user:        todd,
      description: "Duh, you have to TWIST the cookies when you lift them off, otherwise they will break."
    },
    {
      question:    triscuit_question,
      user:        todd,
      description: "Smoked. Gouda. Nuff said."
    },
    {
      question:    triscuit_question,
      user:        mary,
      description: "I like peanut butter and raisins!"
    }
  ])

else
  p "Are you crazy? Don't run the seeds file in anything but development"
end
