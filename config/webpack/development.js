process.env.NODE_ENV = process.env.NODE_ENV || 'development'

const environment = require('./environment')

environment.config.merge({
  externals: {
    "react": "React",
    "react-dom": "ReactDOM"
  }
})

module.exports = environment.toWebpackConfig()

