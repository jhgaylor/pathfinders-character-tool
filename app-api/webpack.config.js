const webpack = require('webpack');
const path = require('path');

const client_src_dir = 'client'
const entrypoint = 'index.jsx'

module.exports = {
  entry: path.join(__dirname, client_src_dir, entrypoint),
  output: {
    path: path.join(__dirname, client_src_dir, 'static', 'js'),
    filename: 'bundle.js'
  },
  module: {
    loaders: [{
      test: path.join(__dirname, client_src_dir),
      loader: ['babel-loader'],
      query: {
        cacheDirectory: 'babel_cache',
        presets: ['react', 'es2015']
      }
    }]
  },
  plugins: [
    new webpack.DefinePlugin({
      'process.env.NODE_ENV': JSON.stringify(process.env.NODE_ENV)
    }),
    new webpack.optimize.DedupePlugin(),
    new webpack.optimize.OccurenceOrderPlugin(),
    // new webpack.optimize.UglifyJsPlugin({
    //   compress: { warnings: false },
    //   mangle: true,
    //   sourcemap: true,
    //   beautify: false,
    //   dead_code: true
    // })
  ]
};