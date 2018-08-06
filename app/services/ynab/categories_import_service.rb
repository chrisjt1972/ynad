module YNAB
  class CategoriesImportService < YNAB::BaseService
    attr_reader :current_user

    def execute!
      current_user.budgets.each do |budget|
        category_group_response = client.categories.get_categories(budget.ynab_id)
        category_groups = category_group_response.data.category_groups

        category_groups.each do |category_group|
          unless new_category_group?(category_group)
            cached_category_group = CategoryGroups::CreateService.new(
              budget,
              category_group_params(category_group)
            ).execute
          end

          category_group.categories.each do |category|
            next if category_exists?(category)

            Categories::CreateService.new(
              cached_category_group,
              category_params(category)
            ).execute
          end
        end
      end
    end

    private

    def new_category_group?(ynab_category_group)
      ::CategoryGroup.find_by(ynab_id: ynab_category_group.id).present?
    end

    def category_group_params(category_group)
      {
        ynab_id: category_group.id,
        name: category_group.name,
        hidden: category_group.hidden
      }
    end

    def category_exists?(category)
      ::Category.find_by(ynab_id: category.id).present?
    end

    def category_params(category)
      {
        ynab_id: category.id,
        name: category.name,
        hidden: category.hidden,
        budgeted_amount: category.budgeted,
        activity_amount: category.activity
      }
    end
  end
end
