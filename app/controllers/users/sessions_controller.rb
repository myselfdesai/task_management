# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  respond_to :json
  def create
    self.resource = warden.authenticate!(auth_options)
    token = Tiddle.create_and_return_token(resource, request)
    render json: { user: resource, authentication_token: token }
  end
end
