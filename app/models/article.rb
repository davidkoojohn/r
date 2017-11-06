# == Schema Information
#
# Table name: articles
#
#  id         :integer          not null, primary key
#  title      :string
#  text       :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Article < ApplicationRecord
  validates :title, presence: true, length: {minimum: 5}
  # Range unspecified. Specify the :in, :within, :maximum, :minimum, or :is option.
  has_many :comments
  
end
