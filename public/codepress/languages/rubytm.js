/*
 * CodePress regular expressions for Perl syntax highlighting
 */

// Ruby
Language.syntax = [
	{ input : /\"(.*?)(\"|<br>|<\/P>)/g, output : '<s>"$1$2</s>' }, // strings double quote 
	{ input : /\'(.*?)(\'|<br>|<\/P>)/g, output : '<s>\'$1$2</s>' }, // strings single quote
	{ input :  /(:[a-z][A-Za-z0-9_]*)/g, output: '<span>$1</span>'},   // symbol
	{ input :  /(\d+)/g, output: '<span>$1</span>'},   // numbers
	{ input : /(def\s+)([\w\.]*)/g, output : '$1<em>$2</em>' }, // functions
	{ input : /(class\s+)([\w]*\s+<\s+)([\w]+)/g,output : '$1<em>$2</em><cite>$3</cite>' }, // classes with parents
	{ input : /(class\s+)([\w]*)/g,output : '$1<em>$2</em>' }, // classes
	{ input : /\b(alias|and|BEGIN|begin|break|case|class|def|defined|do|else|elsif|END|end|ensure|false|for|if|in|module|next|nil|not|or|redo|rescue|retry|return|self|super|then|true|undef|unless|until|when|while|yield)\b/g, output : '<span class="Keyword">$1</span>' }, // reserved words
    { input : /([^A-Za-z_]|^)(guess!|guesses|all_words|word)([^A-Za-z_]|$)/g, output: '$1<span class="Support">$2</span>$3'},  //special support functions/classes
	{ input  : /([\(\){}])/g, output : '<u>$1</u>' }, // special chars
	{ input  : /#(.*?)(<br>|<\/P>)/g, output : '<i>#$1</i>$2' } // comments
];

Language.snippets = []

Language.complete = [
	{ input : '\'',output : '\'$0\'' },
	{ input : '"', output : '"$0"' },
	{ input : '(', output : '\($0\)' },
	{ input : '[', output : '\[$0\]' },
	{ input : '{', output : '{$0}' }		
]

Language.shortcuts = []
