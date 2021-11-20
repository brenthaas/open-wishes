class StaticController < ApplicationController
  def home
    render json: { anything: 'Works!' }
  end
end
