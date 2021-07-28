lua << EOF
package.loaded['nord'] = nil
package.loaded['nord.util'] = nil
package.loaded['nord.colors'] = nil
package.loaded['nord.theme'] = nil
package.loaded['nord.functions'] = nil

require('nord').set()
EOF

set spelllang=fr
let g:vimwiki_list = [{'path': '~/.Wiki',
                      \ 'syntax': 'markdown', 'ext': '.md'}]
