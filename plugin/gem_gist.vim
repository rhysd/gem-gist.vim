command! -nargs=* -bang Gist call gem_gits#upload(expand('%:p'), 0, <q-bang>, <q-args>)
command! -nargs=* -bang GistPrivate call gem_gist#upload(expand('%:p'), 1, <q-bang>, <q-args>)
