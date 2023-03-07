const { environment } = require('@rails/webpacker')

const webpack = require('webpack')
environment.plugins.prepend('Provide',
    new webpack.ProvidePlugin({
        $: 'jquery_2.2.3/src/jquery_2.2.3',
        jQuery: 'jquery_2.2.3/src/jquery_2.2.3'
    })
  )

module.exports = environment
