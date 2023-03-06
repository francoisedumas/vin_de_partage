import { Controller } from "@hotwired/stimulus"
import Compressor from 'compressorjs'

// Connects to data-controller="image-upload"
export default class extends Controller {
  compressImage(event) {
    const file = event.target.files[0]
    if (!file.type.match(/image.*/)) return
    const options = {
      maxWidth: 800, // maximum width of the image in pixels
      maxHeight: 800, // maximum height of the image in pixels
      quality: 0.8, // compression quality between 0 and 1
      success: compressedFile => {
        const newFile = new File([compressedFile], file.name, { type: file.type })
        const dataTransfer = new DataTransfer()
        dataTransfer.items.add(newFile)
        event.target.files = dataTransfer.files
      },
      error: error => {
        console.error(error.message)
      }
    }
    new Compressor(file, options)
  }
}
