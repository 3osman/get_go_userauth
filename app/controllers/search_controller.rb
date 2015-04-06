class SearchController < ApplicationController
  def settlebuddies
    render :layout => false

  end

  def request_settle
   
    req = Request.where(settle_buddy_id: params[:settle_id], client_id: params[:user_id]).first_or_create
    req.status = 1 #pending
    req.save!
    redirect_to "/search/settlebuddies"
  end
  
  def requests_to_settle
        render :layout => false

   
  end
def settle_request
    req = Request.find(params[:request_id])
    req.status = 2
    req.save!
  redirect_to "/search/requests_to_settle"
end
  
end