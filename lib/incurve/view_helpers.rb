module InCurve
  module ViewHelpers
    
    def incurve_css(&block)
      c = capture(&block)
      premailer = StringPremailer.new(StringIO.new(c))
      premailer.to_inline_css.html_safe
    end
      
  end
end