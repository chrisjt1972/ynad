module Categories
  class BaseService
    def initialize(category_group, params = {})
      @category_group = category_group
      @params = params.dup
    end
  end
end
