require 'premailer'

class StringPremailer < Premailer
  
  protected
  
  def load_html(path)
    if path.is_a?(IO) || path.is_a?(StringIO)
      @html_file = "http://foo.bar"
      Hpricot(path.read)
    elsif @is_local_file
      Hpricot(File.open(path, "r") {|f| f.read })
    else
      Hpricot(open(path))
    end
  end
    
end