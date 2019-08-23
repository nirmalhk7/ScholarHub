class Collaboration < ApplicationRecord
  belongs_to :user

  serialize :fields, Array
end
