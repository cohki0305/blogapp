module TabsHelper
  def add_active_class(path)
    'active' if current_page?(path)
  end
end
