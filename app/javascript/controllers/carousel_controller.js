import { Controller } from '@hotwired/stimulus'

// Connects to data-controller="carousel"
export default class extends Controller {
	static targets = ['image', 'title', 'audio']

	connect() {
		this.index = 0
		this.showImageWithTitle()
	}

	previous() {
		this.showImageAtIndex(this.index - 1)
	}

	next() {
		this.showImageAtIndex(this.index + 1)
	}

	showImageWithTitle() {
		this.imageTargets[this.index].classList.remove('hidden')

		const storedSlideDuration = sessionStorage.getItem('slideDuration')
		this.slideDuration = storedSlideDuration
			? parseInt(storedSlideDuration, 10)
			: 5

		setTimeout(() => {
			this.titleTargets[this.index].classList.remove('hidden')
			const audioPlayer = this.audioTargets[this.index].querySelector('audio')
			if (audioPlayer) {
				audioPlayer.play()
			}
		}, this.slideDuration * 1000)
	}

	showImageAtIndex(newIndex) {
		if (newIndex >= 0 && newIndex < this.imageTargets.length) {
			this.imageTargets[this.index].classList.add('hidden')
			this.titleTargets[this.index].classList.add('hidden')

			this.index = newIndex

			this.showImageWithTitle()
		}
	}
}
