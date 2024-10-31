(directive) @directive
(directive_start) @directive_start
(directive_end) @directive_end
(comment) @comment.blade
((parameter) @parameter.blade (#set! "priority" 110)) 
((php_only) @php.blade (#set! "priority" 110)) 
((bracket_start) @bracket_start (#set! "priority" 10)) 
((bracket_end) @bracket_end (#set! "priority" 10)) 
(keyword) @keyword.blade

