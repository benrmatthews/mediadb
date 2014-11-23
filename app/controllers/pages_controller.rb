class PagesController < ApplicationController
  before_filter :setup, only: [:home]

  def home
    @free_plan
    @startup_plan
    if params[:search]
      @contacts = Contact.search(params[:search]).order("created_at DESC")
    else
      @contacts = Contact.all.order('created_at DESC')
    end
  end

  private

  def setup
    plans = Plan.all
    plans.each do |plan|
      if plan.id == 1
        @free_plan = plan
      else
        @startup_plan = plan
      end
    end
  end
end