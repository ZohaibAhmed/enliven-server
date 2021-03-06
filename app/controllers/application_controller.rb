class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :allow_cross_domain_access
  after_filter :cors_set_access_control_headers

  def cors_set_access_control_headers
	headers['Access-Control-Allow-Origin'] = '*'
	headers['Access-Control-Allow-Methods'] = 'POST, GET, OPTIONS'
	headers['Access-Control-Allow-Headers'] = %w{Origin Accept Content-Type X-Requested-With X-CSRF-Token}.join(',')
	headers['Access-Control-Max-Age'] = "1728000"
  end

	def cors_preflight_check
	  if request.method == :options
	    headers['Access-Control-Allow-Origin'] = '*'
	    headers['Access-Control-Allow-Methods'] = 'POST, GET, OPTIONS'
	    headers['Access-Control-Allow-Headers'] = 'X-Requested-With, X-Prototype-Version'
	    headers['Access-Control-Max-Age'] = '1728000'
	    render :text => '', :content_type => 'text/plain'
	  end
	end

	def allow_cross_domain_access
	    headers['Access-Control-Allow-Origin'] = '*'# http://localhost:9000
	    headers['Access-Control-Allow-Headers'] = 'GET, POST, PUT, DELETE, OPTIONS'
	    headers['Access-Control-Allow-Methods'] = %w{Origin Accept Content-Type X-Requested-With X-CSRF-Token}.join(',')
	    headers['Access-Control-Max-Age'] = '1728000'
	end 
end
