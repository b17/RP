module SearchHelper
  def filter_widget(f)
    render f.template, {:filter => f}
  end
end
