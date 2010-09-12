module InCurve
  module ViewHelpers

    def incurve_css(&block)
      c = capture(&block)
      premailer = StringPremailer.new(StringIO.new(c))
      inlined = premailer.to_inline_css

      if Rails::VERSION::MAJOR == 2
        concat(inlined, proc.binding)
      elsif Rails::VERSION::MAJOR == 3
        inlined.html_safe
      else
        puts "Whoa! inline gem can only work with Rails 2.x and Rails 3.x"
      end

    end

  end
end