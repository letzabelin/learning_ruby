# frozen_string_literal: true

class AdminController < ApplicationController
  before_action :admin?
  # layout 'admin'

  def users_count
    @users_count = User.count
    render layout: 'admin'
  end
end
