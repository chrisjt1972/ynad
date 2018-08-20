class CategoryGroup < ApplicationRecord
  belongs_to :budget
  has_many :categories, dependent: :destroy

  validates_uniqueness_of :ynab_id
  validates_presence_of :name, :ynab_id

  YNAB_INTERNAL_CATEGORIES = [
    'Internal Master Category'
  ].freeze

  scope :without_ynab_internal_categories, -> {
    reject { |category_group| YNAB_INTERNAL_CATEGORIES.include?(
      category_group.name
    ) }
  }
end
