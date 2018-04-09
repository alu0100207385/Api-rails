# config/initializers/swagger_docs.rb
class Swagger::Docs::Config
  def self.transform_path(path, api_version)
    # Make a distinction between the APIs and API documentation paths.
    "apidocs/#{path}"
  end
end

Swagger::Docs::Config.base_api_controller = ActionController::API

Swagger::Docs::Config.register_apis({
  '1.0' => {
    :controller_base_path => "",
    :api_file_path => 'public/apidocs',
    :base_path => 'http://localhost:3000',
    :clean_directory => true,
    :parent_controller => ActionController::API,
    :attributes => {
      :info => {
        "title" => "Swagger doc",
        "description" => "This documentation is related to Todos API",
        "contact" => "mail@email.com",
        "license" => "Apache 2.0",
        "licenseUrl" => "http://www.apache.org/licenses/LICENSE-2.0.html"
      }
    }
  }
})