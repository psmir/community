class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  # https://github.com/ruby-hyperloop/hyper-model/issues/13
  regulate_scope :all
end
