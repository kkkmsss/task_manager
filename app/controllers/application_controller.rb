class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern
  helper_method :calculate_progress

  private

  def calculate_progress(tasks)
    return 0 if tasks.empty?
    (tasks.count(&:completed).to_f / tasks.count * 100).round
  end
end
