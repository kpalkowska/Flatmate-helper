module SessionsHelper
  # Logs in the given flatmate.
  def log_in(flatmate)
    session[:flatmate_id] = flatmate.id
  end

  # Returns the current logged-in flatmate (if any).
  def current_flatmate
    @current_flatmate ||= Flatmate.find_by(id: session[:flatmate_id])
  end

  # Returns true if the flatmate is logged in, false otherwise.
  def logged_in?
    !current_flatmate.nil?
  end

  # Logs out the current flatmate.
  def log_out
    session.delete(:flatmate_id)
    @current_flatmate = nil
  end
end
