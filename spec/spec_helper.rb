require 'simplecov'

SimpleCov.start do
  # add_filter '/test/'
  # add_filter '/config/'
  # add_filter '/vendor/'

  add_group 'Controllers', 'app/controllers'
  add_group 'Models', 'app/models'
  add_group 'Helpers', 'app/helpers'
  add_group 'Mailers', 'app/mailers'
end

# Rest of your spec_helper.rb content...

