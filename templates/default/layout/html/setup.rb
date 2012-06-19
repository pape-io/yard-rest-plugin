include Helpers::FilterHelper

def init
  @page_title = options[:title]
  if object == "_index.html"
    
  elsif object.name == :root
    sections :layout, [:index]
  else
    super
  end
end

def stylesheets
  super + %w(css/custom.css)
end

def javascripts
  super + %w(js/rest_plugin.js)
end

def menu_lists
  [ { :type => 'resource', :title => "Resources", :search_title => "List of Resources" },
    { :type => 'topic', :title => "Topics", :search_title => "Topic List" },
    { :type => 'file', :title => "Files", :search_title => "File List" } ]
end

def index
  @readme = options[:readme]
  @resources = index_objects(@objects)
  erb(:index)
end