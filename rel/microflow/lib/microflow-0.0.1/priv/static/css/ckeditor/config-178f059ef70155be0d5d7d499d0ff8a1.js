/**
 * @license Copyright (c) 2003-2016, CKSource - Frederico Knabben. All rights reserved.
 * For licensing, see LICENSE.md or http://ckeditor.com/license
 */

CKEDITOR.editorConfig = function( config ) {
	// Define changes to default configuration here. For example:
	// config.language = 'fr';
	// config.uiColor = '#AADC6E'; 
	
    config.contentsCss = '/css/fonts.css';
		// config.removeButtons = 'Cut,Undo,Redo,Anchor,Underline,Strike,Subscript,NumberedList,Outdent,BulletedList,Indent,Unlink,About,Copy,Paste';
   
//   config.font_style = {
//     element:        'span',
//     styles:         { 'font-family': 'Raleway' },
//     overrides:      [ { element: 'font', attributes: { 'face': null } } ]
// };
   
	config.font_names = 
	        // 'Raleway/Raleway!, sans-serif;' +
	        'RalewayPlus';   
	        // 'Arial/Arial, Helvetica, sans-serif;' +
         //   'Comic Sans MS/Comic Sans MS, cursive;' +
         //   'Courier New/Courier New, Courier, monospace;' +
         //   'Georgia/Georgia, serif;';
            
	config.toolbar = [
		
		{ name: 'basicstyles', items: [ 'Bold', 'Italic', 'Underline', 'Superscript', '-', 'RemoveFormat' ] },
				// { name: 'styles', items: [ 'Styles', 'Format' ] },
				{ name: 'clipboard', items: [ 'Cut', 'Copy', 'Paste', ] },
				{ name: 'links', items: [ 'Link', ] },
				{ name: 'fonts', items: [ 'Font', ] }
				

			  ];
	

};

	// Define changes to default configuration here. For example:
	// config.language = 'fr';
	// config.uiColor = '#AADC6E';
	// 


	
  
	
	



// config.toolbarGroups = [
// 		{ name: 'document', groups: [ 'mode', 'document', 'doctools' ] },
// 		{ name: 'clipboard', groups: [ 'undo', 'clipboard' ] },
// 		{ name: 'editing', groups: [ 'find', 'selection', 'spellchecker', 'editing' ] },
// 		{ name: 'forms', groups: [ 'forms' ] },
// 		{ name: 'basicstyles', groups: [ 'basicstyles', 'cleanup' ] },
// 		{ name: 'paragraph', groups: [ 'list', 'indent', 'blocks', 'align', 'bidi', 'paragraph' ] },
// 		{ name: 'links', groups: [ 'links' ] },
// 		{ name: 'insert', groups: [ 'insert' ] },
// 		{ name: 'styles', groups: [ 'styles' ] },
// 		{ name: 'colors', groups: [ 'colors' ] },
// 		{ name: 'tools', groups: [ 'tools' ] },
// 		{ name: 'others', groups: [ 'others' ] },
// 		{ name: 'about', groups: [ 'about' ] }
// 	];


$(document).ready(function() {
   CKEDITOR.config.removePlugins = 'save,print,preview,find,about,maximize,showblocks';
});