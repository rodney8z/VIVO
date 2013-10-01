/* $This file is distributed under the terms of the license in /doc/license.txt$ */

var newIndividualFormUtils = {

    onLoad: function(mode,country) {
        this.initObjectReferences();                 
        this.bindEventListeners();
    },

    initObjectReferences: function() {
    this.form = $('#newIndividual');
    
    // The external auth ID field and messages
    this.fName = $('#firstName');
    this.lName = $('#lastName');
    this.rdfsLabel = $('#label');
    },
    
    bindEventListeners: function() {
        this.idCache = {};
        
        this.form.submit(function() {
            newIndividualFormUtils.buildRDFSLabel();
        });    
    
    },

    buildRDFSLabel: function() {
        if ( this.fName.length > 0 ) {
            this.rdfsLabel.val(this.lName.val() + ", " + this.fName.val());
        }
    },
}

$(document).ready(function() {   
    newIndividualFormUtils.onLoad();
}); 