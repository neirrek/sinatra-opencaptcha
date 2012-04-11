require 'sinatra/base'
require 'rest_client'
require 'uuidtools'

module Sinatra

  # A Sinatra module to seamlessly integrate OpenCaptcha
  # to Sinatra applications.
  # See: http://www.opencaptcha.com
  #
  module OpenCaptcha

    VERSION = "1.0.0"
    
    @@default_opts = {
      :width => 110,
      :height => 50,
      :show_answer_input => true,
      :answer_input_label => 'Your answer: ',
      :answer_input_class => nil
    }
    
    # A utility method to set the http proxy to be used
    # for connecting to the OpenCatcha server.
    #
    def self.set_proxy(proxy_url)
      RestClient.proxy = proxy_url
    end
    
    # Generate the html tags for inserting the OpenCaptcha image and
    # (if wanted) the answer input field in the form to be protected
    # against automatic spam.
    #
    def open_captcha(opts={})
      mopts = @@default_opts.merge(opts)
      mopts[:image_name] = "#{SecureRandom.hex(16)}-#{mopts[:height]}-#{mopts[:width]}.jpgx"
      erb :opencaptcha, :views => File.dirname(__FILE__), :locals => mopts
    end
    
    # Check whether the user answer to the OpenCaptcha is valid or not.
    # It returns 'true' if the answer is valid, otherwise 'false'.
    #
    def open_captcha_valid?(answer_field = :open_captcha_answer)
      image_name = params[:open_captcha_image_name]
      answer = params[answer_field]
      RestClient.get("http://www.opencaptcha.com/validate.php?img=#{image_name}&ans=#{answer}").to_s == 'pass'
    end
    
  end
  
  helpers OpenCaptcha
  
end