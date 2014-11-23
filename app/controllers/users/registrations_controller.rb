class Users::RegistrationsController < Devise::RegistrationsController

  def new
    unless (params[:plan] == '1' || params[:plan] == '2')
      flash[:notice] = "Please select a plan to sign up."
      redirect_to root_url
    end
  end
  
  def update_plan
    @user = current_user
    @user.update_attributes(plan_id: params[:plan], email: params[:email], stripe_card_token: params[:user][:stripe_card_token])
      if @user.plan_id == 2
        @user.save_with_payment
        redirect_to edit_user_registration_path, notice: "Updated to premium!"
      else
        flash[:error] = "Unable to update plan."
        render :edit
      end
  end

  def cancel_plan
    @user = current_user
    if @user.cancel_user_plan(params[:customer])
      @user.update_attributes(stripe_customer_token: nil, plan_id: 1)
      flash[:notice] = "Canceled subscription."
      redirect_to edit_user_registration_path
    else
      flash[:error] = "There was an error canceling your subscription. Please notify us."
      render :edit
    end
  end

  private

  def build_resource(*args)
    super
    if params[:plan]
      resource.plan_id = params[:plan]
      if resource.plan_id == 2
        resource.save_with_payment
      else
        resource.save
      end
    end
  end

  def setup
    plans = Plan.all
    plans.each do |plan|
      unless plan.id == 1
        @startup_plan = plan
      end
    end
  end
end