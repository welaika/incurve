require 'active_support'
require 'incurve/string_premailer'

module InCurve
  
  class << self
    def enable
      enable_actionpack
    end
    
    def enable_actionpack
      return if ActionView::Base.instance_methods.include_method? :incurve_css
      require 'incurve/view_helpers'
      ActionView::Base.send :include, ViewHelpers
    end    
  end

end

if defined? Rails
  InCurve.enable_actionpack if defined? ActionController
end
