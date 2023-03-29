class Subject < ApplicationRecord
  paginates_per 10
  has_many  :questions
end
