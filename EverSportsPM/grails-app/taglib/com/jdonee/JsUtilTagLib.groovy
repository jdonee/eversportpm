package com.jdonee

import com.jdonee.JsUtilService
/**
 * JsUtil tags.
 * Javascript Utility tags.
 */
class JsUtilTagLib {
	static namespace = 'jsUtil'

	def js = new JsUtilService()

	/**
	 * Resources.
	 * To be included in the page head tag.
	 */
	def resources = { attrs ->
		out << g.javascript(src: "jsUtil.js")
	}

	/**
	 * Toggle the visibility of an html element and update an image.
	 * @param toggleId The html id of the element to toggle.
	 * @param imageId The html id to apply to the image.
	 * @param openImgUrl The url to apply as the image src when toggled element is visible.
	 * @param closedImgUrl The url to apply as the image src when toggled element is hidden.
	 * @param effect The effect to apply, 'fade' uses the fade/appear effect while the default is to just toggle.
	 * @param text The text, if any, to display.
	 * @param useDiv Whether or not to use a wrapping div, default is 'true'.
	 */
	def toggleControl = { attrs ->
		def mb = new groovy.xml.MarkupBuilder(out)

		def toggleJs

		// Do we want to fade/appear or just toggle.
		if(attrs.effect == "fade")
			toggleJs = js.toggleWithImgAndEffect(attrs.toggleId, attrs.imageId, attrs.openImgUrl, attrs.closedImgUrl)
		else
			toggleJs = js.toggleWithImg(attrs.toggleId, attrs.imageId, attrs.openImgUrl, attrs.closedImgUrl)

		if(attrs.useDiv == 'false') {
			mb.a( href: toggleJs ) {
				mkp.yieldUnescaped(attrs.text)
				img(id: attrs.imageId, src: attrs.closedImgUrl, alt: "Show")
			}

		}
		else {
			mb.div() {
				a( href: toggleJs ) {
					mkp.yieldUnescaped(attrs.text)
					img(id: attrs.imageId, src: attrs.closedImgUrl, alt: "Show")
				}
			}
		}

	} // hideShowControl

} // end class
