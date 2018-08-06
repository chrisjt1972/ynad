module Categories
  class CreateService < Categories::BaseService
    attr_reader :category_group, :params

    def execute
      category = category_group.categories.build(params)

      category.tap do |category|
        category.save!
      end

    rescue ActiveRecord::RecordInvalid => e
      fail(error: e.message)
    rescue StandardError => e
      fail(error: e.message)
    end
  end
end
