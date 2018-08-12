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

  def update_errors!(h = {})
    mutate.errors h
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
