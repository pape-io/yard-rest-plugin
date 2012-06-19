include Helpers::ModuleHelper
include Helpers::FilterHelper

def generate_topic_list
  topic_objects = index_objects(@objects).reject { |o| o.root? }
  @topics = {}

  topic_objects.each do |object|
    object.tags('topic').each { |topic| (@topics[topic.text] ||= []) << object }
  end

  @list_title = 'Topic List'
  @list_type = 'topic'

  asset('topic_list.html', erb(:full_list))
end

def generate_resource_list
  @items = index_objects(@objects)
  @list_title = "List of Resources"
  @list_type = "resource"
  asset('resource_list.html', erb(:full_list))
end

def init
  super
  asset("css/custom.css", file("css/custom.css", true))
end