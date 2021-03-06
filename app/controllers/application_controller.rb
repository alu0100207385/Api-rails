class ApplicationController < ActionController::API
  include Response
  include ExceptionHandler

  # called before every action on controllers
  before_action :authorize_request
  attr_reader :current_user

  def inherited(subclass)
    super
    subclass.class_eval do
      setup_basic_api_documentation
    end
  end

  class << self

    Swagger::Docs::Generator::set_real_methods

    def inherited(subclass)
      super
      subclass.class_eval do
        setup_basic_api_documentation
      end
    end

    private

    def setup_basic_api_documentation
      [:index, :show, :create, :update, :delete].each do |api_action|
        swagger_api api_action do
          #param :header, 'Accept', :string, :optional, 'Content Negotiation'
          param :header, 'Authorization', :string, :required, 'Authorization-token'
        end
      end
    end
  end

  private 

   # Check for valid request token and return user
  def authorize_request
    @current_user = (AuthorizeApiRequest.new(request.headers).call)[:user]
  end

end