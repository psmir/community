class TextareaInput < Hyperloop::Component
  include InputCommon

  param :rows, type: Integer, default: 10, allow_nil: true

  render(DIV, class: 'form-group') do
    TEXTAREA(class: "form-control #{error.present? ? 'is-invalid' : ''}",
      placeholder: params.placeholder, value: value, rows: params.rows
    )
    .on(:change) do |e|
      change(e.target.value)
    end
    DIV(class: 'invalid-feedback') do
      error
    end
  end
end
