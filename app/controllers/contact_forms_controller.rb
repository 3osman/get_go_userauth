class ContactFormsController < ApplicationController
  skip_before_filter :authenticate_user!
  before_filter :render_nothing


  def new
    @contact_form = Contact.new
  end

  def create
    @contact_form = ContactForm.new(params[:contact])
    @contact_form.request = request
    if @contact_form.deliver
      flash.now[:notice] = 'Thank you for your message. We will contact you soon!'
    else
      flash.now[:error] = 'Cannot send message.'
      render :new
    end
  end
  private
def render_nothing
  render :nothing => true
end
end