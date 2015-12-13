var path = require('path');

module.exports = {
  entry: './src/index.coffee',
  output: {
    path: './src/assets',
    filename: 'game-bundle.js',
  },
  module: {
    loaders: [{
      test: /\.coffee$/,
      include: [
        path.resolve(__dirname, '../src')
      ],
      loader: 'coffee!coffeelint'
    }, {
      loader: 'script',
      test: /(pixi|phaser).js/
    }, {
      test: /\.frag$/i,
      loader: 'raw'
    }]
  },
  resolve: {
    extensions: ['', '.js', '.coffee']
  },
  devtool: 'source-map'
};
