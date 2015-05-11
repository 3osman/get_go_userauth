class Users::RegistrationsController < Devise::RegistrationsController
  before_filter :configure_sign_up_params, only: [:create]
  before_filter :configure_account_update_params, only: [:update]
  before_filter :configure_permitted_parameters
  skip_before_filter :require_no_authentication, only: :create

  # GET /resource/sign_up
  # def new
  #   super
  # end

  # POST /resource
 def create
    super
    ss = SettlebuddySupport.new(user_id: resource.id)
    ss.save
    handle_roadmap(resource.id)
 end
 
 def handle_roadmap(u_id)
  all_tasks = Hash.new
  all_steps = Hash.new
  dire = Rails.root.join("app/assets/files")
  Dir.foreach(dire) do |item|
    next if item == '.' or item == '..'
    file = File.open("#{dire}/#{item}", "rb")
    task = file.read
    
    title = task.split(/\r?\n/)[0].split("TASK:")[1]
    #puts title
  #puts title
  #puts '=================='
    all_tasks["#{title}"] = Hash.new
    other = task.split(title)[1]
    sections = other.split("==================")
   
    if !sections.empty?
      sections.each do |section|
        sec_title = section.split( /\r?\n/)[1]
       # puts sec_title
        sec_content = section.split(sec_title)[1][2..-1]
       # puts sec_content
        if sec_title.include?"Link"
         sec_content.delete! "\r", "\n"
        end
        if sec_title.include?"Step"
          #puts section
          #puts "===================="
          steps = section.split("Step")
          steps.each do |step|

            step_title = step.split("Start")[0]
            step_content = step.split("Start")[1]
            
            if !(all_steps.has_key?"#{title}")
            all_steps["#{title}"] = Hash.new
          end
            all_steps["#{title}"]["#{step_title}"] = step_content
            #puts all_steps
          end
           
        else
          all_tasks["#{title}"]["#{sec_title}"] = sec_content
  
        end
        
      end
    end
  end
  #all_tasks #task title is key, then key of section (documents, link,etc..), then content
  #all_steps #task title is key, then key of subtask, then content
  roadmap = Roadmap.new(rating:1, user_id:resource.id, country: resource.country_of_origin)
  roadmap.save!
  all_tasks.each do |key, value|
    #puts key
    if resource.country_of_origin.eql?("Europe") && key.eql?("Non- EU Visa Procedure") || resource.duration.eql?("Less than 6 months") && key.eql?("Residence Permit")
    else
      task = Task.new(name:key, roadmap_id:roadmap.id, done:false)
          task.save!
  
      value.each do |k,v|
       
  
        if k.include?"Documents Needed"
          v.split("\n").each do |doc|
            docu = Document.new(name:doc, task_id:task.id,done:false)
            docu.save!
          end
        elsif k.include?"When to start"
          task.application_time = v
        elsif k.include?"Link Description"
          link = Link.where(task_id: task.id).first_or_create
          link.link_description = v
          link.save!
        elsif k.include?"Link source"
          link = Link.where(task_id: task.id).first_or_create
          link.link_src = v
          link.save!
        elsif k.include?"Task Description"
          task.description = v
        
          
        end
      end
    end
    all_steps["#{key}"].each do |k,v|
      if resource.country_of_origin.eql?("Europe") && key.eql?("Non- EU Visa Procedure") || resource.duration.eql?("Less than 6 months") && key.eql?("Residence Permit")
    else
      if v.eql?("\r\n") || v.eql?("\n") || v.eql?("\n\r")
      else
        subtask = Subtask.new(task_id:task.id, done:false, name:k, description:v)
        subtask.save!
       end
end
    end
    if resource.country_of_origin.eql?("Europe") && key.eql?("Non- EU Visa Procedure") || resource.duration.eql?("Less than 6 months") && key.eql?("Residence Permit")
    else
    task.save!
    end
  end
 
 end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  protected
  # You can put the params you want to permit in the empty array.
  
  def configure_sign_up_params
    params.require(:user).permit(:email, :password, :password_confirmation, :name, :public_roadmap, :city_of_studies, :country_of_origin, :duration, :birthdate, :settlebuddy, :settlebuddy_supports_attributes => [:settlebuddy_support, :bank, :visa, :housing, :public_transport,:caf,:telecommunication])
  end

  # You can put the params you want to permit in the empty array.
  def configure_account_update_params
    devise_parameter_sanitizer.for(:account_update).push(:email, :password, :password_confirmation, :current_password,:public_roadmap,:name, :city_of_studies, :country_of_origin, :duration, :birthdate, :settlebuddy, :settlebuddy_supports_attributes => [:settlebuddy_support, :bank, :visa, :housing, :public_transport,:caf,:telecommunication])
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up).push(:name, :city_of_studies, :country_of_origin, :public_roadmap,:duration,:birthdate, :settlebuddy, :settlebuddy_supports_attributes => [:settlebuddy_support, :bank, :visa, :housing, :public_transport,:caf,:telecommunication])

  end
# The path used after sign up.
# def after_sign_up_path_for(resource)
#   super(resource)
# end

# The path used after sign up for inactive accounts.
# def after_inactive_sign_up_path_for(resource)
#   super(resource)
# end
end
