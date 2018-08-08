module FormCommon
  def self.included(base)
    base.attr_accessor :store
  end

  def store_errors!(e)
    store.update_errors! fetch_errors(e)
  end

  def fetch_errors(e)
    if e.is_a? Hyperloop::Operation::ValidationException
      e.errors.message
    elsif e.is_a? Hyperloop::Operation::Exit
      e.result.try(:errors)
    elsif e.is_a? ApplicationRecord
      e.errors.messages
    else
      { base: e.try(:message) }
    end
  end
end
