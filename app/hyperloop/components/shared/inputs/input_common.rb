module InputCommon
  def self.included(base)
    base.param :name
    base.param :placeholder
    base.param :store
  end

  def value
    params.store.fields[params.name]
  end

  def error
    params.store.errors[params.name]
  end

  def change(v)
    params.store.update_fields!(params.name => v)
  end
end
