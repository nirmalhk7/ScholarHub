class Paper < ApplicationRecord
  belongs_to :user
  belongs_to :institute

  serialize :fields, Array

  filterrific :available_filters => %w[
    with_journal_link
    with_institute
    with_fields
    with_abstract
    with_author
  ]

  self.per_page = 10

  scope :with_journal_link, ->(query) {
    return nil if query.blank?
    terms = query.split(/\s+/)
    clause = terms.map { 'journal_link ~* ?' }.join(' OR ')

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
  scope :with_abstract, ->(query) {
    return nil if query.blank?
    terms = query.split(/\s+/)
    clause = terms.map { 'abstract ~* ?'}.join(' OR ')
    
    where(clause, *terms)
  }
  scope :with_author, ->(query) {
    return nil if query.blank?
    terms = query.split(/\s+/)
    clause = terms.map { 'name ~* ? OR email ~* ?'}.join(' OR ')

    user_ids = User.where(clause, *(terms * 2)).ids
    where(user_id: user_ids)
  }
end
