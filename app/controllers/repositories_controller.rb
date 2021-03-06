class RepositoriesController < ApplicationController
  def index
    response = Faraday.get "https://api.github.com/user/repos" do |req|
      req.headers = {
        "Authorization" => "token #{session[:token]}",
        "Accept" => 'application/json'
      }
    end
    @repos = JSON.parse(response.body)
  end

  def create #comes from index form
    response = Faraday.post "https://api.github.com/user/repos", {name: params[:name]}.to_json, {'Authorization' => "token #{session[:token]}", 'Accept' => 'application/json'}
    redirect_to '/'
  end
end
