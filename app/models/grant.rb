class Grant < ApplicationRecord
  serialize :fields, Array

  filterrific :available_filters => %w[
    with_title
    with_fields
    with_description
    before_deadline
  ]

  self.per_page = 10

  scope :with_title, ->(query) {
    return nil if query.blank?
    terms = query.split(/\s+/)
    clause = terms.map { 'title ~* ?' }.join(' OR ')

    where(clause, *terms)
  }
  scope :with_fields, ->(query) {
    return nil if query.blank?
    terms = query.split(/\s+/)
    clause = terms.map { 'fields ~* ?'}.join(' OR ')

    where(clause, *terms)
  }
  scope :with_description, ->(query) {
    return nil if query.blank?
    terms = query.split(/\s+/)
    clause = terms.map { 'description ~* ?'}.join(' OR ')
    
    where(clause, *terms)
  }

  scope :before_deadline, ->(query) {
    where('submission_deadline <= ?', query)
  }
end
