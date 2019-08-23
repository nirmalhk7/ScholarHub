class Paper < ApplicationRecord
  belongs_to :user
  belongs_to :institute

  serialize :fields, Array
end
