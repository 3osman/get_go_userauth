class StaticPagesController < ApplicationController
  skip_before_action :authenticate_user!
  def home

    if user_signed_in?
      redirect_to :controller => 'roadmaps', :action => 'show', :id => current_user.roadmap.id
    else
      render :layout => false

    end

  end

end
