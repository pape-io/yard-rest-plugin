def init
  super
  sections.push(:index,[:argument,
                        :optional_argument,
                        :key_for,
                        :value_for,
                        :example_request,
                        :request_field,
                        :example_response,
                        :response_field,
                        :header,
                        :response_code,
                        :status_codes, 
                        :resource_object_properties])
end

def request_field
  generic_tag :request_field
end

def response_field
  generic_tag :response_field
end

def argument
  generic_tag :argument, :no_types => false
end

def optional_argument
  generic_tag :optional_argument, :no_types => false
end

def header
  generic_tag :header
end

def response_code
  generic_tag :response_code
end


def generic_tag(name, opts = {})
  return unless object.has_tag?(name)
  @no_names = true if opts[:no_names]
  @no_types = true if opts[:no_types]
  @name = name
  out = erb('generic_tag')
  @no_names, @no_types = nil, nil
  out
end
