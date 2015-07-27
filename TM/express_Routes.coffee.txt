
module.exports = (app,express)->

  "[custom][express_Routes] adding routes".log()

  # example of sending json
  app.get  '/custom/config.json', (req,res)->
    res.json global.config

  # example of sending simple text
  app.get  '/custom/config', (req,res)->
    res.setHeader('Content-type', 'text/plain');
    res.end global.config.json_Pretty()

  # example of mapping a static folder to the main routes
  static_Files = __dirname.path_Combine('static')
  app.use express['static'](static_Files)


  app.get '/custom/:page', (req, res, next)->
    if req.params?.page
      jade_File = __dirname.path_Combine "/jade/#{req.params?.page}.jade"
      if jade_File.file_Exists()
        return res.render jade_File

    next()

  app.get '/custom/aaa', (req, res)->
    jade_File = __dirname.path_Combine '/jade/test.jade'
    res.render jade_File