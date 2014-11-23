module ApplicationHelper

  def home
    @free_plan
    @startup_plan
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
  
  def display_base_errors resource
    return '' if (resource.errors.empty?) or (resource.errors[:base].empty?)
    messages = resource.errors[:base].map { |msg| content_tag(:p, msg) }.join
    html = <<-HTML
    <div class="alert alert-error alert-block">
      <button type="button" class="close" data-dismiss="alert">&#215;</button>
      #{messages}
    </div>
    HTML
    html.html_safe
  end

end
