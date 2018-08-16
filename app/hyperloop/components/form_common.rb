module FormCommon
  def self.included(base)
    base.attr_accessor :store
  end

  def store_errors!(e)
    store.update_errors! prepare_errors(e)
  end

  def prepare_errors(e)
    errors = fetch_errors(e)
    format_errors errors
  end

  def fetch_errors(e)
    if e.is_a? Hash
      e
    elsif e.is_a? Hyperloop::Operation::ValidationException
      e.errors.message
    elsif e.is_a? Hyperloop::Operation::Exit
      e.result.try(:errors).try(:messages) || e.result.try(:errors)
    elsif e.is_a? ApplicationRecord
      e.errors.messages
    else
      { base: e.try(:message) }
    end
  end


  # can receive { 'some_field' => 'error' }
  # or { 'some_field' => ['error1', 'error2'] }
  # or from the client side save method {"some_field"=>[{"message"=>"can't be blank"}] }
  # and return { 'some_field' => 'error1; error2' }
  #
  def format_errors(h)
    h.transform_values do |v|
      if v.is_a? Array
        v = v.map do |i|
          i.is_a?(Hash) ? i.values.uniq.join('; ') : i
        end.uniq.join('; ')
      end
      v
    end
  end
end
