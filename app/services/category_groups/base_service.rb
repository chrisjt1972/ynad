module CategoryGroups
  class BaseService
    def initialize(budget, params = {})
      @budget = budget
      @params = params.dup
    end
  end
end
