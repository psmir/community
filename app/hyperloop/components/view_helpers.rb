module ViewHelpers
  def truncate(text, options = {})
    if text
      length = options.fetch(:length, 30)
      omission = options.fetch(:omission, '...')
      return text unless text.length > length

      return "#{text[0, length]}#{omission}"
    end
  end
end
