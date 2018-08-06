module CategoryGroups
  class CreateService < CategoryGroups::BaseService
    attr_reader :budget, :params

    def execute
      category_group = budget.category_groups.build(params)

      category_group.tap do |category_group|
        category_group.save!
      end

    rescue ActiveRecord::RecordInvalid => e
      fail(error: e.message)
    rescue StandardError => e
      fail(error: e.message)
    end
  end
end
