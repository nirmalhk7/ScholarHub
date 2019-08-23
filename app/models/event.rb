class Event < ApplicationRecord
  belongs_to :institute

  serialize :fields, Array
  serialize :phone_numbers, Array

  filterrific :available_filters => %w[
    with_institute
    with_title
    with_description
    with_certification
    with_fields
  ]

  self.per_page = 10

  scope :with_description, ->(query) {
    return nil if query.blank?
    terms = query.split(/\s+/)
    clause = terms.map { 'description ~* ?' }.join(' OR ')

    where(clause, *terms)
  }

  scope :with_institute, ->(query) {
    return nil if query.blank?
    terms = query.split(/\s+/)
    clause = terms.map { 'name ~* ?' }.join(' OR ')

    institute_ids = Institute.where(clause, *terms)
    where(institute_id: institute_ids)
  }
  scope :with_fields, ->(query) {
    return nil if query.blank?
    terms = query.split(/\s+/)
    clause = terms.map { 'fields ~* ?'}.join(' OR ')

    where(clause, *terms)
  }
  scope :with_title, ->(query) {
    return nil if query.blank?
    terms = query.split(/\s+/)
    clause = terms.map { 'title ~* ?'}.join(' OR ')
    
    where(clause, *terms)
  }

  scope :with_certification, ->(query) {
    return nil if query.blank?
    where(certification: query)
  }

end
