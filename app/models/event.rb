class Event < ApplicationRecord
  belongs_to :institute

  serialize :fields, Array
  serialize :phone_numbers, Array
end
