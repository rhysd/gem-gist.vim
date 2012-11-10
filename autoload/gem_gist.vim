function! gem_gist#upload(file, private, open, description, ...)
    if ! ( executable('gist') || executable('jist') )
        echoerr "This command requires gist gem. Please do `gem install gist.` or `gem install jist`"
        return
    endif

    if filereadable(a:file)
        if executable('jist')
            let cmd = join([
                        \ 'jist',
                        \ a:file,
                        \ (a:private ? '' : '--public'),
                        \ '--description', shellescape(a:description),
                        \ (a:open ==# '!' ? '--open' : '')
                        \ ], ' ')
        elseif executable('gist')
            let cmd = join([
                        \ 'gist',
                        \ a:file,
                        \ (a:private ? '--private' : '--no-private'),
                        \ '--description', shellescape(a:description),
                        \ (a:open ==# '!' ? '--open' : '--no-open')
                        \ ], ' ')
        endif
        let result = ''
        try
            let result = vimproc#system(cmd)
        catch
            let result = system(cmd)
        finally
            echo result
        endtry
    endif
endfunction
