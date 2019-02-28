class EmailsController < ApplicationController
  def index
    @emails = Email.all
  end

  def show
    @email = Email.find(params[:id])
    @email.update(:read => true)
     respond_to do |format|
       format.html { redirect_to root_path }
       format.js
     end
  end

  def destroy
    @email = Email.find(params[:id])
    if @email.destroy
      respond_to do |format|
        format.html {redirect_to task_path}
        format.js
      end
      else
    redirect_to root_path
    end
  end

  private
  def email_params
    params.permit(:object, :body, :read)
  end

end
