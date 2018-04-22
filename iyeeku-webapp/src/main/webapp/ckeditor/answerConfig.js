/**
 * @license Copyright (c) 2003-2016, CKSource - Frederico Knabben. All rights reserved.
 * For licensing, see LICENSE.md or http://ckeditor.com/license
 */

CKEDITOR.editorConfig = function( config ) {
	config.language='zh-cn';
	config.height=160;
	config.image_previewText=' ';
	config.filebrowserUploadUrl="ckeditorImgUpload.do";
	
	config.toolbar = [
	   [ 'Link','Unlink','-','TextColor','BGColor','-','Image','Flash','Table',
	     '-','Bold', 'Italic','Strike','-','NumberedList','BulletedList',
	     '-','JustifyLeft','JustifyCenter','-','Blockquote','CodeSnippet','Format',
	     '-','Source','Maximize'
	    ]
	 ];
	config.extraPlugins='codesnippet';
};
