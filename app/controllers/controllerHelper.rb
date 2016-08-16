module AuthenticationControllerHelper

  def authorized?(user_id)
    #must pass something like: @review.reviewer
    logged_in? && user_id == current_user.id
  end

  def restricted_access(object)
    redirect_to '/categories' unless authorized?(object)
  end

  def logged_in_access
    redirect_to no_access_path unless logged_in?
  end
end
