/*******************************************************************************
* KindEditor - WYSIWYG HTML Editor for Internet
* Copyright (C) 2006-2011 kindsoft.net
*
* @author Roddy <luolonghao@gmail.com>
* @site http://www.kindsoft.net/
* @licence http://www.kindsoft.net/license.php
*******************************************************************************/

// google code prettify: http://google-code-prettify.googlecode.com/
// http://google-code-prettify.googlecode.com/

KindEditor.plugin('newcode', function(K) {
	var self = this, name = 'newcode';
	self.clickToolbar(name, function() {
		var lang = self.lang(name + '.'),
		 html = ['<div style="padding:10px 20px;">',
            '<div class="ke-dialog-row">',
            '<select class="ke-code-type">',
            '<option value="js">JavaScript</option>',
            '<option value="html">HTML</option>',
            '<option value="css">CSS</option>',
            '<option value="php">PHP</option>',
            '<option value="pl">Perl</option>',
            '<option value="py">Python</option>',
            '<option value="ruby">Ruby</option>',
            '<option value="java">Java</option>',
            '<option value="vb">ASP/VB</option>',
            '<option value="cpp">C/C++</option>', 
            '<option value="c-sharp">C#</option>',
            '<option value="xml">XML</option>',
            '<option value="shell">Shell</option>',
            '<option value="as3">ActionScript3</option>',
            '<option value="cf">ColdFusion</option>',
            '<option value="delphi">Delphi</option>',
            '<option value="diff">diff</option>',
            '<option value="erl">Erlang</option>',
            '<option value="groovy">Groovy</option>',
            '<option value="jfx">JavaFX</option>',
            '<option value="plain">Plain Text</option>',
            '<option value="scala">Scala</option>',
            '<option value="sql">SQL</option>',
            '<option value="">Other</option>',
            '</select>',
            '</div>',
            '<textarea class="ke-textarea" style="width:408px;height:260px;"></textarea>',
            '</div>'].join(''),
			dialog = self.createDialog({
				name : name,
				width : 450,
				title : self.lang(name),
				body : html,
				yesBtn : {
					name : self.lang('yes'),
					click : function(e) {
						var type = K('.ke-code-type', dialog.div).val(),
							code = textarea.val(),
							cls = type === '' ? '' :  ' lang-' + type,
							html = '<pre class="brush:' + type + ';">\n' + K.escape(code) +'</pre>';
						if (K.trim(code) === '') {
							alert(lang.pleaseInput);
							textarea[0].focus();
							return;
						}
						self.insertHtml(html).hideDialog().focus();
					}
				}
			}),
			textarea = K('textarea', dialog.div);
		textarea[0].focus();
	});
});
