class Article < ApplicationRecord
  validates :title, presence: true, length: {minimum: 5}

  # Range unspecified. Specify the :in, :within, :maximum, :minimum, or :is option.

end
