class PagesController < ApplicationController
  skip_before_action :authenticate_counselor!, only: [ :home ]

  def home
  end
end
