require 'redmine'

Redmine::Plugin.register :redmine_dashboard do
  name 'Redmine Dashboard plugin'
  author 'Terentyev Andrey'
  description 'Bigbuzzy dashboard plugin'
  version '0.0.1'
  url ''
  author_url ''
  permission :dashboard, {:dashboard => [:index]}, :public => true
  menu :project_menu, :dashboard, { :controller => 'dashboard', :action => 'index' }, :caption => 'Дэшборд', :after => :activity, :param => :project_id
end
