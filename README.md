Sinatra-OpenCaptcha
===================

A Sinatra module to seamlessly integrate OpenCaptcha to Sinatra applications.

See http://www.opencaptcha.com for more information about OpenCaptcha

Installation
------------

gem install sinatra-opencaptcha

Use example
-----------

    require 'sinatra/base'
    require 'sinatra/opencaptcha'

    get '/' do
      erb :index
    end

    post '/' do
      if open_captcha_valid?
        "Welcome, dear #{params[:name]}!"
      else
        "Go away, bloody spamming machine!"
      end
    end

    __END__

    @@ index
    <html>
      <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Insert title here</title>
      </head>
      <body>
        <form action="/" method="post">
          <p><label for=\"name\">My name: </label><input type="text" id="name" name="name"/></p>
          <%= open_captcha :answer_input_label => 'Votre réponse*: ', :answer_input_class => 'text' %>
          <p><input type="submit" value="Submit"/></p>
        </form>
      </body>
    </html>