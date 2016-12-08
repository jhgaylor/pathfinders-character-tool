const webpack = require('webpack');
const path = require('path');
var HtmlWebpackPlugin = require('html-webpack-plugin');


const client_src_dir = 'src'
const entrypoint = 'index.jsx'

module.exports = {
  entry: path.join(__dirname, client_src_dir, entrypoint),
  output: {
    path: path.join(__dirname, 'dist', 'static'),
    filename: 'js/[hash].js'
  },
  module: {
    loaders: [{
      test: /\.jsx/,
      loader: 'babel-loader',
      query: {
        cacheDirectory: 'babel_cache',
        presets: ['react', 'es2015']
      }
    }, {
      test: /\.hbs/,
      loader: 'handlebars'
    }]
  },
  plugins: [
    new webpack.DefinePlugin({
      'process.env.NODE_ENV': JSON.stringify(process.env.NODE_ENV)
    }),
    new webpack.optimize.DedupePlugin(),
    new webpack.optimize.OccurenceOrderPlugin(),
    new HtmlWebpackPlugin({
      title: 'Pathfinder Character Helper',
      template: 'src/index.hbs'
    })
    // new webpack.optimize.UglifyJsPlugin({
    //   compress: { warnings: false },
    //   mangle: true,
    //   sourcemap: true,
    //   beautify: false,
    //   dead_code: true
    // })
  ]
};