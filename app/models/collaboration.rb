class Collaboration < ApplicationRecord
  belongs_to :user

  serialize :fields, Array

  filterrific :available_filters => %w[
    with_title
    with_description
    with_author
    with_fields
  ]

  self.per_page = 10

  scope :with_title, ->(query) {
    return nil if query.blank?
    terms = query.split(/\s+/)
    clause = terms.map { 'title ~* ?' }.join(' OR ')

    where(clause, *terms)
  }

  scope :with_description, ->(query) {
    return nil if query.blank?
    terms = query.split(/\s+/)
    clause = terms.map { 'description ~* ?' }.join(' OR ')

    where(clause, *terms)
  }

  scope :with_author, ->(query) {
    return nil if query.blank?
    terms = query.split(/\s+/)
    clause = terms.map { 'name ~* ? OR email ~* ?' }.join(' OR ')

    user_ids = User.where(clause, *(terms * 2)).ids

    where(user_id: user_ids)
  }
  scope :with_fields, ->(query) {
    return nil if query.blank?
    terms = query.split(/\s+/)
    clause = terms.map { 'fields ~* ?' }.join(' OR ')

    where(clause, *terms)
  }
end
