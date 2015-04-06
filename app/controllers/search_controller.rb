class SearchController < ApplicationController
    before_filter :init_foo_list
def search_library
  
  if (params[:search_lib].eql?"")
   
      @search_result_lib = User.where('id<>?', current_user.id).all

  else
  @search_result_lib = User.where('(name LIKE ? OR city_of_studies LIKE ? OR country_of_origin LIKE ?) AND id<>?', "%#{params[:search_lib]}%","%#{params[:search_lib]}%","%#{params[:search_lib]}%", current_user.id).all
  
  end 
  render :library, :layout => false
  
end
  def settlebuddies
      if (params[:search_clause].nil?)
              @search_result = User.where('settlebuddy=? AND id<>?', true,current_user.id).all

      end

    if current_user.settlebuddy?
      flash[:alert]="You are a settle buddy yourself!"
      redirect_to edit_user_registration_path
    else
   
        first = Request.where(client_id: current_user.id, c_view_status: false).first
       if !first.nil?
         first.c_view_status = true
         first.save!
         flash[:notice] = "#{User.find(first.settle_buddy_id).name} accepted your request"

         Request.where(client_id: current_user.id, c_view_status: false).drop(1).each do |req|
           req.c_view_status = true
           req.save!
           flash[:notice] << "#{User.find(req.settle_buddy_id).name} accepted your request"
         end
       end
       
       render :layout => false
      
    end

  end
  def library
     if (params[:search_lib].nil?)
              @search_result_lib = User.where('id<>?', current_user.id).all

      end

    render :layout => false
  end
  
def search_settle_buddy
  
  if (params[:search_clause].eql?"")
   
      @search_result = User.where('settlebuddy=? AND id<>?', true,current_user.id).all

  else
  @search_result = User.where('(name LIKE ? OR city_of_studies LIKE ? OR country_of_origin LIKE ?) AND settlebuddy=? AND id<>?', "%#{params[:search_clause]}%","%#{params[:search_clause]}%","%#{params[:search_clause]}%", true,current_user.id).all
  
  end 
  render :settlebuddies, :layout => false

end
  def request_settle
   
    req = Request.where(settle_buddy_id: params[:settle_id], client_id: params[:user_id]).first_or_create
    req.status = 1 #pending
    req.s_view_status = false #turn on notification for settlebuddy
    req.c_view_status = true #turn off notification for client

    req.save!

    redirect_to "/search/settlebuddies"
  end
  
  def requests_to_settle
    if !(current_user.settlebuddy?)
      flash[:alert]="You are not a settle buddy!"
      redirect_to edit_user_registration_path
    else
       first = Request.where(settle_buddy_id: current_user.id, s_view_status: false).first
       if !first.nil?
         first.s_view_status = true
         first.save!
         flash[:notice] = "#{User.find(first.client_id).name} wants you as settlebuddy"

         Request.where(settle_buddy_id: current_user.id, s_view_status: false).drop(1).each do |req|
           req.s_view_status = true
           req.save!
           flash[:notice] << "#{User.find(req.client_id).name} wants you as settlebuddy"
         end
       end
       
       render :layout => false
    end

   
  end
  def settle_request
      req = Request.find(params[:request_id])
      req.status = 2 #aacepted
      req.c_view_status = false #turn on notification for client
      req.save!
      flash[:notice].clear
      redirect_to "/search/requests_to_settle"
  end
  def init_foo_list
    @search_result ||= []
        @search_result_lib ||= []

  end
    
end