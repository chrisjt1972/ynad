module YNAB
  class CategoriesImportService < YNAB::BaseService
    attr_reader :current_user

    def execute!
      current_user.budgets.each do |budget|
        category_group_response = client.categories.get_categories(budget.ynab_id)
        category_groups = category_group_response.data.category_groups

        category_groups.each do |category_group|
          CategoryGroups::CreateService.new(
            budget,
            category_group_params(category_group)
          ).execute
        end
      end
    end

    private

    def category_group_params(category_group)
      {
        name: category_group.name,
        hidden: category_group.hidden
      }
    end
  end
end
