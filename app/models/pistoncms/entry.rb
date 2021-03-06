module Pistoncms
  class Entry < ActiveRecord::Base
    acts_as_paranoid

    BULK_ACTIONS = {trash: 'Move to Trash'}

    # Validations
    validates :title, presence: true, uniqueness: true
    validates :name, uniqueness: true

    # Callbacks
    before_validation :_set_name

    private

    def _set_name
      self.name = self.title.squish.parameterize if self.title
    end

  end
end