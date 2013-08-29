'use strict'

class ImageDotter

	init: ->

		@.destHeight = 600
		@.destWidth = 1000

		@.dropzone = document.getElementById('dropzone')

		@.canvas = document.getElementById('canvas')
		@.content = canvas.getContext('2d')

		@.setUpDropzoneDragDropEvents()

		@

	setUpDropzoneDragDropEvents: ->

		console.log('setting up dropzone')

		@.dropzone.ondragover = ->
			console.log('dragged over')
			this.className = 'hover'

			return false

		@.dropzone.ondragend = ->
			console.log('dragged off')
			this.className = ''

			return false

		@.dropzone.ondrop = (event) ->
			console.log('DROPITLIKEITISHOT')
			event.preventDefault()

			this.className = ''

			files = event.dataTransfer.files
			self.sourceImage = files[i]

			self.readUploadedImageData()

			@

		@

	readUploadedImageData: (file) ->

		self = this

		reader = new FileReader()

		reader.onload = ->
			image = new Image()

			sourceImage = image;

			self.renderImage()

			@

		reader.readAsDataURL(file)

		@

	renderImage: (imageData) ->
		sourceX = 0
		sourceY = 0

		sourceHeight = @.sourceImage.height
		sourceWidth  = @.sourceImage.width

		if sourceWidth > sourceHeight
			@.destWidth *= (sourceWidth / sourceHeight)
			sourceX = -((destWidth - destHeight) / 2)
		else
			@.destHeight *= (sourceHeight / sourceWidth)
			sourceY = -((destHeight - destWidth) / 2)

		@.context.drawImage(@.sourceImage, sourceX, sourceY, @.destWidth, @.destHeight)

		@

imageDotter = new ImageDotter

imageDotter.init()