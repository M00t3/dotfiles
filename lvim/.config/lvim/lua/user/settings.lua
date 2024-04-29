vim.cmd([[

set relativenumber
set clipboard=unnamed               " Copy paste between vim and everything else
set scrolloff=13                           " minimum line number above and below of cursor

]])


vim.cmd([[
" c language
fun! RunCLang()
    execute ':!gcc -o main.out %'
    execute ':FloatermToggle'
    execute ':FloatermSend --name=run ./main.out '
    return 0
endfun

fun! RunCppLang()
    execute ':!g++ -o main.out %'
    execute ':FloatermToggle'
    execute ':FloatermSend --name=run ./main.out '
    return 0
endfun

fun! RunVimScripts()
    execute ':FloatermToggle'
    execute ':FloatermSend --name=run vim +source  % '
    return 0
endfun

fun! OpenPdfViewer()
    execute ':!nohup zathura   %:r.pdf &>/dev/null &  '
endfun

autocmd BufRead,BufNewFile *.vim set filetype=vim
autocmd  FileType  vim  map <F5> :call RunVimScripts()<CR>
autocmd  FileType  vim  map <Leader>x :call RunVimScripts()<CR>
autocmd  FileType  vim  map <leader><C-m> :call RunVimScripts()<CR>

autocmd  FileType  c  map <F5> :call RunCLang()<CR>
autocmd  FileType  c  map <Leader>x :call RunCLang()<CR>
autocmd  FileType  c  map <leader><C-m> :call RunCLang()<CR>

autocmd  FileType  cpp  map <F5> :call RunCppLang()<CR>
autocmd  FileType  cpp  map <Leader>x :call RunCppLang()<CR>
autocmd  FileType  cpp  map <leader><C-m> :call RunCppLang()<CR>

" autocmd  FileType  cpp  map <F5> :call RunCppLang()<CR>
autocmd  FileType nroff map <F5> :call OpenPdfViewer()<CR>
autocmd  FileType nroff map <leader><C-m> :!compiler %<CR>

autocmd  BufWritePost  *.md  :silent ! ~/.scripts/mdtpdf -i "%:p" -o /tmp/pandoc_output.pdf &>/dev/null
]])
