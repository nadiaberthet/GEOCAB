class TodoList < ApplicationRecord
  belongs_to :user
  has_many :tasks
end

# reliee la reponse utilisateur a la todo list
# table user with questions
# ou creee la view des questionnaire
