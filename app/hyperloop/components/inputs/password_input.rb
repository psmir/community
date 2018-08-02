class PasswordInput < Hyperloop::Component
  include InputCommon

  render(DIV, class: 'form-group') do
    INPUT(class: "form-control #{error.present? ? 'is-invalid' : ''}",
      placeholder: params.placeholder, value: value, type: 'password'
    )
    .on(:change) do |e|
      change(e.target.value)
    end
    DIV(class: 'invalid-feedback') do
      error
    end
  end
end
