'use strict'
game = require '../game'

filter = null
sprite = null
logo = null
counter = 0
step = Math.PI * 2 / 360


createBootState = ->
  headerText = 'Boot State'

  headerTextStyle =
    font: '26pt Helvetica'
    fill: '#e0e4f0'
    align: 'center'

  filter = new Phaser.Filter game, null, require '../assets/shaders/example.frag'
  filter.setResolution game.width, game.height

  sprite = game.add.sprite()
  sprite.width = 800
  sprite.height = 800
  sprite.filters = [filter]

  headText = game.add.text game.world.centerX, 32, headerText, headerTextStyle

  logo = game.add.sprite 0, 0, 'phaser'
  logo.alpha = 0.5
  logo.x = game.width / 2
  logo.anchor.x = logo.anchor.y = 0.5

updateBootState = ->
  filter?.update game.input.activePointer
  tStep = Math.sin counter
  logo.y = game.height / 2 + tStep * 30
  logo.rotation += Phaser.Math.degToRad 0.1 * tStep
  counter += step

module.exports =
  preload: ->
    game.load.image 'phaser', 'sprites/phaser.png'
  create: createBootState
  update: updateBootState
  render: ->
    game.debug.spriteInfo logo, 32, 32
