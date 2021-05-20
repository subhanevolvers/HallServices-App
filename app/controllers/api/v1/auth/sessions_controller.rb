class Api::V1::Auth::SessionsController < DeviseTokenAuth::SessionsController

  protected

  def render_create_success
    return render json: {data: resource_data(resource_json: @resource.token_validation_response)}
  end

end
