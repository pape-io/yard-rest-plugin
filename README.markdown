# Yardoc RESTful Web Service Plugin

originally by [vWorkApp](http://www.vworkapp.com)  
rewritten for 0.3.0 by [rknLA](http://github.com/rknLA) with substantial help from [lsegal](http://gnuu.org/)  
customized by [spape](http://github.com/spape) for the [MAdeK](http://github.com/zhdk/madek)
further customization by [DerNalia](http://github.com/DerNalia) for [TinderBox](http://gettinderbox.com)
[API-Documentation](http://medienarchiv.zhdk.ch/api)

A plugin for [Yardoc](http://yardoc.org/) that generates documentation for RESTful web services. 

## Install
Bundler will reduce your headaches, so, please you that  
	gem 'yard-rest' # in your gemfile
	
You may need to include the following dependencies as well:
	gem 'redcarpet'  
	gem 'yard'
	
It also requires the Jeweler gem if you plan to use the rake build tasks.

You'll probably want to add these to your .gitignore as well
	/.yardoc/*/*  
	/.yardoc/*  
	/public/api
	
So you'll have to re-genenarte your API on every machine. This should encourage more up to dateness

## Execution
It is recommended that you use a .yardopts file
	--title "My API Documentation"  
	--plugin rest  
	--readme API_README  
	--output-dir ./public/api  
	app/models/*.rb  
	app/controllers/*.rb

So that way, whenever you want to generate your API docs, you simply need to run only
	bundle exec yardoc
	

## See an API-Example

[Yard-Rest-Plugin](http://DerNalia.github.com/yard-rest-plugin) and get a look to the "Example" resource.

## Demo (see the plugin in action)

Visit [TinderBox API Documentation](http://mytinder.com/api/) for a demonstration.

## Writing Comments

The following tags are provided:

- @resource resource. Specifies the resource (controller action/method) that the service is accessed from. This tag is compulsory, only **classes** and **methods** that include this in their comments are included in the API documentation.

- @url url. Specifies the URL which someone should use to access that resource.

- @action action. Specifies the http action (GET, POST, PUT etc.).

- @status\_codes Any possible returned states codes that the API user may need to handle.

- @required [type] name description. Specifies an argument that must be passed to the service. You can specify as many of these as you need.

- @optional [type] name description. Specifies an optional argument that may be passed to the service. You can specify as many of these as you need. 

- @response_field [type] name description. Further specifies the fields that are returned within the response.

- @resource\_object ModelName. A modal that users of the API should know about.

- @resource\_object\_properties Description of the modal and attributes that the API user should know about.

- @resource\_object\_footnotes Anything else that needs to be said about the model
### Examples

Examples should always be together in the following order: example_request, example_request_description, example_response, example_response_description (as soon as you write a example_request you need a following example_response and the other way around).

Markdown rendering for the text is activated if a tags text contains a newline (see example).

- @example_request example. An example of the request that is send to the service.

- @example_request_description description. The description text for the example request.

- @example_response example. An example of the response that is returned from the service.

- @example_response example.
    ```json
    {
      "examples": [{
        "id":1,
        "title":"Animals",
        "text":"Dogs and cats are some.",
        "highlight":true
       }]
    }
    ```

- @example_response_description example. The description text for the example response.

## Ignored Documentation

This plugin only documents **classes** and **methods** with **@resource** or **@resource\_object** tags. It does not support module documentation. It also documents **Constants** of **@resource\_object**s that have the **@resource** tag.

## Example:
For controllers: 
	
	##
	# A thing characteristic of its kind or illustrating a general rule: 
	# it's a good example of how European action can produce results | some of these carpets are among the finest examples of the period.
	class ExamplesController
	  ##
	  # Get a collection of examples:
	  # 
	  # @resource index
	  # @url /examples[ .format ]
	  #
	  # @action GET
	  # 
	  # @optional [Boolean] highlight Show only highlighted examples.
	  #
	  # @response_field [Array] examples The collection of examples.  
	  #
	  # @status_codes possible API status codes  
	  #  404 - Not Found 
	  #  401 - Unauthorized
	  #  422 - Unprocessable Entity
	  #  200 - OK
	  # 
	  #
	  # @example_request {}
	  # @example_request_description Just requests an index of samples. 
	  # @example_response {"examples": [{"id":1, "title":"Animals", "text":"Dogs and cats are some.", "highlight":true}, {"id":2, "title":"Computers", "text":"Windows PC or Apple's Macintosh.", "highlight":false}]}
	  # @example_response_description Responds with the index of examples.
	  # 
	  # @example_request {"highlight": true}
	  # @example_request_description Request only highlighted examples.
	  # @example_response 
	  #   ```json
	  #   {
	  #     "examples": [{
	  #       "id":1,
	  #       "title":"Animals",
	  #       "text":"Dogs and cats are some.",
	  #       "highlight":true
	  #     }]
	  #   }
	  #   ```
	  # @example_response_description Responds only with highlighted examples.
	  #
	  def index
	    #...
	  end
	end

And for models:

	##
	# @resource_object ExamplesModel
	# @resource_object_properties
	#   ExamplesModel{
	#     id: Integer
	#     name: String
	#   }
	#
	# @resource_object_footnotes
	#   (1) For visibility, see {Shared}
	class ExamplesModel

	  # @resource
	  CONSTANT_VARIABLE = 3

	  # internal documentation
	  # not picked up by yard-rest-plugin
	  # @return something_else
	  def something
	    #...
	  end

	end

## Development

As always, you can see what tasks are available by running:
    
    rake -T

You can run the template locally over the included sample code by using the following rake tasks:
    
    rake ex:clean
    rake ex:generate



