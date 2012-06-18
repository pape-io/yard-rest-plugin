# Define custom tags
YARD::Tags::Library.define_tag("URL for the Resource",          :resource)
YARD::Tags::Library.define_tag("Object Used in Resource",       :resource_object)
YARD::Tags::Library.define_tag("Resource Object Properties",    :resource_object_properties)
YARD::Tags::Library.define_tag("Resource Object Footnotes",     :resource_object_footnotes)
YARD::Tags::Library.define_tag("URL",                           :url)
YARD::Tags::Library.define_tag("HTTP-Action for the Resource",  :action)

YARD::Tags::Library.define_tag("Required Arguments",            :required,          :with_types_and_name)
YARD::Tags::Library.define_tag("Optional Arguments",            :optional,          :with_types_and_name)

YARD::Tags::Library.define_tag("Example Request",               :example_request)
YARD::Tags::Library.define_tag("Example Request Description",   :example_request_description)
YARD::Tags::Library.define_tag("Request Fields",                :request_field,     :with_types_and_name)

YARD::Tags::Library.define_tag("Example Response",              :example_response)
YARD::Tags::Library.define_tag("Example Response Description",  :example_response_description)
YARD::Tags::Library.define_tag("Response Fields",               :response_field,    :with_types_and_name)

YARD::Tags::Library.define_tag("Headers",                       :header, :with_name)

YARD::Tags::Library.define_tag("Status Codes",                          :status_codes)
