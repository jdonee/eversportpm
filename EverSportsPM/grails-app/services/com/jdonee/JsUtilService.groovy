package com.jdonee

/**
* Provides some javascript utility methods.
* For use with JsUtilTagLib.
*/
class JsUtilService {

    boolean transactional = false

    def g = new org.codehaus.groovy.grails.plugins.web.taglib.ApplicationTagLib()

    /**
    * Toggle the visibility of an html element.
    * @param id The html id of the element.
    * @param type The type of html action the javascript will be applied to e.g 'onclick', defaults to 'href'.
    * @returns A javascript string that can be assigned for example to an anchor href or onclick action.
    */
    def toggle(id, type="href") {
        def s = 'toggleUtil(\"' + id + '\");'
        if(type == "onclick")
            s + ' return false;'
        else
            'javascript: ' + s
    }

    /**
    * Toggle the visibility of an html element and update an image.
    * @param toggleId The html id of the element to toggle.
    * @param imageid The html id of the image to update.
    * @param openImgUrl The url to apply as the image src when toggled element is visible.
    * @param closedImgUrl The url to apply as the image src when toggled element is hidden.
    * @param type The type of html action the javascript will be applied to e.g 'onclick', defaults to 'href'.
    * @returns A javascript string that can be assigned for example to an anchor href or onclick action.
    */
    def toggleWithImg(toggleId, imageid, openImgUrl, closedImgUrl, type="href") {

        def s = 'toggleWithImgUtil(\"' + toggleId +'\", \"' + imageid +'\", \"' + openImgUrl +'\", \"' + closedImgUrl +'\");'
        if(type == "onclick")
            s + ' return false;'
        else
            'javascript: ' + s

    }

    /**
    * Show an html element by slowly increasing the visibility.
    * @param id The html id of the element.
    * @param type The type of html action the javascript will be applied to e.g 'onclick', defaults to 'href'.
    * @returns A javascript string that can be assigned for example to an anchor href or onclick action.
    */
    def show(id) {
        def s = 'showUtil(\"' + id + '\");'
        if(type == "onclick")
            s + ' return false;'
        else
            'javascript: ' + s
    }

    /**
    * Hide an html element by slowly decreasing the visibility.
    * @param id The html id of the element.
    * @param type The type of html action the javascript will be applied to e.g 'onclick', defaults to 'href'.
    * @returns A javascript string that can be assigned for example to an anchor href or onclick action.
    */
    def hide(id) {
        def s = 'hideUtil(\"' + id + '\");'
        if(type == "onclick")
            s + ' return false;'
        else
            'javascript: ' + s
    }

    /**
    * Toggle the visibility of an html element and update an image.
    * @param toggleId The html id of the element to toggle.
    * @param imageid The html id of the image to update.
    * @param openImgUrl The url to apply as the image src when toggled element is visible.
    * @param closedImgUrl The url to apply as the image src when toggled element is hidden.
    * @param type The type of html action the javascript will be applied to e.g 'onclick', defaults to 'href'.
    * @returns A javascript string that can be assigned for example to an anchor href or onclick action.
    */
    def toggleWithImgAndEffect(toggleId, imageid, openImgUrl, closedImgUrl, type="href") {

        def s = 'toggleWithImgAndEffectUtil(\"' + toggleId +'\", \"' + imageid +'\", \"' + openImgUrl +'\", \"' + closedImgUrl +'\");'
        if(type == "onclick")
            s + ' return false;'
        else
            'javascript: ' + s

    }

} // end class
