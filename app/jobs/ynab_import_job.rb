class YNABImportJob < ApplicationJob
  queue_as :ynab_importer

  def perform(user_id:)
    binding.pry
    user = User.find(user_id)

    YNAB::ImportService.new(user).execute
  end
end
