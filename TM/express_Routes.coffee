
module.exports = (app,express)->

  # Use to support showing the /logos/TP_Logo.gif file
  static_Files = __dirname.path_Combine('static')
  app.use express['static'](static_Files)

  # if global.custom.custom_navigation exists the .logo value will be inserted in
  # pages like navbar_logged_out.jade
  global.custom.custom_navigation =
    logo : '/logos/TP_Logo.gif'