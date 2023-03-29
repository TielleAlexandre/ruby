class Answer < ApplicationRecord
  belongs_to :question

  paginates_per 5
end
