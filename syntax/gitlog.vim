syn match gitLgLine     /^[_\*|\/\\ ]\+\(\<\x\{4,40\}\>.*\)\?$/
syn match gitLgHead     /^[_\*|\/\\ ]\+\(\<\x\{4,40\}\> - ([^)]\+)\( ([^)]\+)\)\? \)\?/ contained containedin=gitLgLine
syn match gitLgDate     /([^)]*)/ contained containedin=gitLgHead nextgroup=gitLgRefs skipwhite
syn match gitLgRefs     /([^)]*)/ contained containedin=gitLgHead
syn match gitLgGraph    /^[_\*|\/\\ ]\+/ contained containedin=gitLgHead,gitLgCommit nextgroup=gitHashAbbrev skipwhite
syn match gitLgCommit   /^[^-]\+- / contained containedin=gitLgHead nextgroup=gitLgDate skipwhite
syn match gitLgIdentity /<[^>]*>$/ contained containedin=gitLgLine
highlight def link gitLgGraph    Comment
highlight def link gitLgDate     gitDate
highlight def link gitLgRefs     gitReference
highlight def link gitLgIdentity gitIdentity
