'use strict'
game = require './game'
boot = require './states/boot'
if process.env isnt 'production'
  console.log 'Debug Mode'
  window.Phaser = Phaser
  window.PIXI = PIXI

game.state.add 'boot', boot

game.state.start 'boot'
