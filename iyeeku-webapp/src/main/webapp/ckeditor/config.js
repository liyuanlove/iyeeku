/**
 * @license Copyright (c) 2003-2016, CKSource - Frederico Knabben. All rights reserved.
 * For licensing, see LICENSE.md or http://ckeditor.com/license
 */

CKEDITOR.editorConfig = function( config ) {
	// Define changes to default configuration here. For example:
	// config.language = 'fr';
	// config.uiColor = '#AADC6E';
	
	config.language='zh-cn';
	
//	config.width=800;
	config.height=320;
//	//:'kama'(),'office2003','v2'
//	config.skin='office2013';
//	config.skin='bootstrapck';
	
//	config.uiColor='#FFF';
//	//
//	config.toolbar='Full';
	config.image_previewText=' ';
	config.filebrowserUploadUrl="ckeditorImgUpload.do";
	
	config.toolbar = [
	   [ 'Cut', 'Copy', 'Paste', 'PasteText', 'PasteFromWord'
	     , '-',"Format","Font","FontSize",'lineheight','-','Bold', 'Italic','Underline','Strike',
	     'TextColor','BGColor','RemoveFormat','-','Find','Replace','-','NumberedList','BulletedList',
	     'Outdent','Indent','JustifyLeft','JustifyCenter','JustifyRight',
	     '-','Link','Unlink',"Image",'Smiley','SpecialChar','Table'
	     ,"CodeSnippet",'Maximize']
	 ];
	
	
/*	config.toolbar =
		[
		    ['Source','-','Save','NewPage','Preview','-','Templates'],
		    ['Cut','Copy','Paste','PasteText','PasteFromWord','-','Print', 'SpellChecker', 'Scayt'],
		    ['Undo','Redo','-','Find','Replace','-','SelectAll','RemoveFormat'],
		    ['Form', 'Checkbox', 'Radio', 'TextField', 'Textarea', 'Select', 'Button', 'ImageButton', 'HiddenField'],
		    '/',
		    ['Bold','Italic','Underline','Strike','-','Subscript','Superscript'],
		    ['NumberedList','BulletedList','-','Outdent','Indent','Blockquote'],
		    ['JustifyLeft','JustifyCenter','JustifyRight','JustifyBlock'],
		    ['Link','Unlink','Anchor'],
		    ['Image','Flash','Table','HorizontalRule','Smiley','SpecialChar','PageBreak'],
		    '/',
		    ['Styles','Format','Font','FontSize'],
		 ['TextColor','BGColor']
		];*/
	
	// 添加插件，多个插件用逗号隔开
	config.extraPlugins='codesnippet,lineheight';
	config.line_height="16px;17px;18px;19px;20px;21px;22px;23px;24px;25px;26px;"
	// 使用zenburn的代码高亮风格样式 PS:zenburn效果就是黑色背景
	//如果不设置着默认风格为default
	//codeSnippet_theme: 'zenburn';
    codeSnippet_theme: 'monokai_sublime';
	
//	config.line_height="20px;22px;24px;26px;28px;30px;32px;34px;36px;"
	
};
