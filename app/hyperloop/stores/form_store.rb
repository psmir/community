class FormStore < Hyperloop::Store
  def self.create!(h = {})
    s = self.new
    s.mutate.fields(h)
    s.mutate.errors({})
    s
  end

  def fields
    state.fields
  end

  def errors
    state.errors
  end

  def update_fields!(h = {})
    mutate.fields.merge!(h)
  end


  # can receive { 'some_field' => 'error' }
  # or { 'some_field' => ['error1', 'error2'] }
  #
  def update_errors!(h = {})
    mutate.errors({})
    h.each do |k, v|
      v = v.join('; ') if v.is_a? Array
      mutate.errors.merge!(k => v)
    end
  end

  def clear_fields!
    h = state.fields.transform_values { |v| '' }
    update_fields!(h)
  end

  def clear_errors!
    mutate.errors({})
  end

  def has_base_errors?
    errors[:base].present?
  end
end
