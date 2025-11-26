"==========ОБЩИЕ==========
"ОСНОВНЫЕ НАСТРОЙКИ
set updatetime=2000
set tabstop=4
set shiftwidth=4
set smarttab
set expandtab
set smartindent
set number
set hlsearch
set incsearch
set ignorecase


"ПЕРЕМЕННЫЕ
let mapleader = " "
"Флаг автоматического запуска подсветки ошибок
let g:auto_check_enabled = 0

"СЕТАПЫ ДЛЯ ЯЗЫКОВ
autocmd FileType cs call CSharpSetup()
autocmd FileType python call PythonSetup()

"ОБЩИЕ ПЛАГИНЫ
call plug#begin('~/.vim/plugged')
    Plug 'dracula/vim', { 'as': 'dracula' }
    Plug 'OmniSharp/omnisharp-vim', { 'for': 'cs' }
    Plug 'prabirshrestha/asyncomplete.vim', { 'for': 'cs' }
    Plug 'prabirshrestha/asyncomplete.vim', { 'for': 'python' }
    Plug 'prabirshrestha/asyncomplete-lsp.vim', { 'for': 'python' }
    Plug 'mattn/vim-lsp-settings', { 'for': 'python' }
    Plug 'prabirshrestha/vim-lsp', { 'for': 'python' }
call plug#end()

"ХОТКЕИ
"Компилировать
nnoremap <F5> :make<CR>
"Открыть окно Quickfix
nnoremap <F6> :call ToggleQuickFix()<CR>:call HighlightQuickfixErrors()<CR>
"Предыдущая ошибка в окне Quickfix
nnoremap <F7> :try\|cprev\|catch\|clast\|endtry<CR>
"Следующая ошибка в окне Quickfix
nnoremap <F8> :try\|cnext\|catch\|cfirst\|endtry<CR>
"Запуск с отслеживанием runtime ошибок
nnoremap <F9> :call RunInTerminal()<CR>
"Включение\отключение автопроверки кода на одну кнопку
nnoremap <leader>ac :let g:auto_check_enabled = !g:auto_check_enabled<CR>:echo g:auto_check_enabled ? "✅ Авто-проверка ВКЛ" : "❌ Авто-проверка ВЫКЛ"<CR>
"Листание автокомплита вперёд
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
"Листание автокомплита назад
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
"Закрыть автокомплит
inoremap <expr> <CR> pumvisible() ? asyncomplete#close_popup() : "\<CR>"
"Передвижение каретки вправо в insert mode
inoremap jk <ESC><Right>
inoremap kj <ESC><Right>
inoremap <C-p> <Right>

"НАСТРОЙКА ПЛАГИНОВ
"Цветовая схема
colorscheme dracula
filetype plugin indent on

"НАСТРОЙКА ЦВЕТОВ
"Подсветка ошибок Quickfix
highlight QuickfixError term=underline cterm=underline ctermfg=red guifg=red
"Подсветка редупреждений Quickfix
highlight QuickfixWarning term=underline cterm=underline ctermfg=yellow guifg=yellow
"Значки на полях для ошибок
sign define QuickfixErrorSign text=E! texthl=QuickFixError
"Значки на полях для предупреждений
sign define QuickfixWarningSign text=W! texthl=QuickFixWarning

"UPDATE-КОМАНДЫ

"СЕТАПЫ ДЛЯ ЯЗЫКОВ
"==========C#==========
    function! CSharpSetup()
        "Настройка quickfix
        set makeprg=dotnet\ build
        set errorformat=%f(%l\\,%c):\ %t%*[a-z]\ CS%n:\ %m,%-G%.%#

        "Настройка Omnisharp
        let g:OmniSharp_server_use_net6 = 1
        let g:OmniSharp_highlight_types = 2
        let g:OmniSharp_completion_without_overloads = 1

        let g:OmniSharp_diagnostic_showid = 1
        let g:OmniSharp_highlighting = 2 
        let g:OmniSharp_open_quickfix = 0

        let g:OmniSharp_enable_signature_help = 1
        let g:OmniSharp_signature_help_min_width = 80
        let g:OmniSharp_signature_help_max_width = 120

        "Форматирование файла
        nnoremap <leader>cf : OmniSharpCodeFormat<CR>
        "Проверка на ошибки
        nnoremap <leader>cc : OmniSharpGlobalCodeCheck<CR>
        "Чёта сделать с кодом крч)
        nnoremap <leader>ca : OmniSharpGetCodeActions<CR>
        "Просмотр типа
        nnoremap <leader>t : OmniSharpTypeLookup<CR>
        "Ручное включение signature help
        nnoremap <leader>sh :OmniSharpSignatureHelp<CR>

        "Проверка на неподвижный курсор
        autocmd CursorHold *.cs call AutoCheck()
        autocmd CursorHoldI *.cs call AutoCheck()
        "Форматирование при сохранении файла
        autocmd BufWritePost *.cs OmniSharpCodeFormat
        "Автовызов signature help при вводе '(' + закрытие круглой скобки
        autocmd FileType cs inoremap <silent> ( ()<Left><C-O>:OmniSharpSignatureHelp<CR>
        " Квадратные скобки (без signature help)
        autocmd FileType cs inoremap <silent> [ []<Left>
        " Фигурные скобки (без signature help)
        autocmd FileType cs inoremap <silent> { {}<Left>
        " Кавычки
        autocmd FileType cs inoremap <silent> " ""<Left>
        autocmd FileType cs inoremap <silent> ' ''<Left>
        "Автоформат при enter между скобками (любыми)
        autocmd FileType cs inoremap <expr> <CR> SmartEnterBetweenBrackets()

        "Подсветка меню signature help
        highlight Pmenu ctermbg=Black ctermfg=White guibg=#2e3440 guifg=#d8dee9
        "Подсветка выбранного элемента signature help
        highlight PmenuSel ctermbg=DarkGray ctermfg=White guibg=#5e81ac guifg=#eceff4
    endfunction

    "==========PYTHON==========
    function! PythonSetup()
        " LSP для Python
        set completeopt=menuone,noinsert,noselect
        let g:asyncomplete_auto_completeopt = 1
        let g:asyncomplete_auto_popup = 1
        let g:asyncomplete_popup_delay = 200
        let g:lsp_diagnostics_virtual_text_enabled = 0
        let g:lsp_diagnostics_highlights_enabled = 0
        let g:lsp_document_highlight_enabled = 1
        let g:lsp_signs_enabled = 1
        let g:lsp_diagnostics_signs_enabled = 0
        let g:lsp_auto_loc_list = 0

        nnoremap <F5> :echo "Это питон. Тут нет компиляци"<CR>
        "Форматирование файла
        nnoremap <leader>cf :LspDocumentFormat()<CR>
        "Проверка на ошибки
        nnoremap <leader>cc :call PythonCodeCheck()<CR>
        "Чёта сделать с кодом крч)
        nnoremap <leader>ca :LspCodeActions<CR>
        "Просмотр типа
        nnoremap <leader>t :LspHover<CR>
        "Ручное включение signature help
        nnoremap <leader>sh :LspSignatureHelp<CR>

        "Проверка на неподвижный курсор
        autocmd CursorHold *.py call AutoCheck()
        autocmd CursorHoldI *.py call AutoCheck()
        "Форматирование при сохранении файла
        autocmd BufWritePost *.py LspDocumentFormat
        "Автовызов signature help при вводе '(' + закрытие круглой скобки
        autocmd FileType python inoremap <silent> ( ()<Left><C-O>:LspSignatureHelp<CR>
        " Квадратные скобки (без signature help)
        autocmd FileType python inoremap <silent> [ []<Left>
        " Фигурные скобки (без signature help)
        autocmd FileType python inoremap <silent> { {}<Left>
        " Кавычки
        autocmd FileType python inoremap <silent> " ""<Left>
        autocmd FileType python inoremap <silent> ' ''<Left>
        "Автоформат при enter между скобками (любыми)
        "autocmd FileType python inoremap <expr> <CR> SmartEnterBetweenBrackets()

    endfunction

"ФУНКЦИИ
"Функция, которая закрывает и открывает окно Quickfix одной кнопкой
function! ToggleQuickFix()
    for win in range(1, winnr('$'))
        if getwinvar(win, '&buftype') == 'quickfix'
            cclose
            return
        endif
    endfor
    copen
    wincmd p
endfunction


"Функция, которая подсвечивает ошибки из Quickfix
function! HighlightQuickfixErrors()
    call clearmatches()
    sign unplace *
    let error_lines = {} 
    for item in getqflist()
        if item.valid && item.bufnr == 1
            if has_key(item, 'col')
                " ДОБАВЛЯЕМ ЗНАЧКИ НА ПОЛЯ
                if item.type == 'e'
                    let error_lines[item.lnum]=1 
                    execute 'sign place ' . item.lnum . ' line=' . item.lnum . ' name=QuickfixErrorSign file=' . bufname(item.bufnr)
                elseif item.type == 'w' && !has_key(error_lines, item.lnum)
                    execute 'sign place ' . item.lnum . ' line=' . item.lnum . ' name=QuickfixWarningSign file=' . bufname(item.bufnr)
                endif

                let start_col = item.col
                let end_col = item.end_col
                 
                " Если есть end_col - подсвечиваем диапазон, иначе 1 символ
                if item.end_col != 0
                    let end_col = item.end_col
                    if item.end_col < start_col
                        let temp = end_col
                        let end_col = start_col
                        let start_col = temp
                    endif
                    let pattern = '\%' . item.lnum . 'l\%>' . (start_col - 1) . 'c.*\%<' . (end_col + 1) . 'c'
                elseif start_col != 1
                    let pattern = '\%' . item.lnum . 'l\%' . (start_col - 2) . 'c..'  " 3 символа с позиции
                else
                    " Один символ
                    let pattern = '\%' . item.lnum . 'l\%' . start_col . 'c.'
                endif
                if item.type == 'e'
                    call matchadd('QuickfixError', pattern)
                elseif item.type == 'w'
                    call matchadd('QuickfixWarning', pattern)
                endif
            else
                echo "✗ Нет колонки в item" . item.text
            endif
        endif
    endfor
endfunction

"Функция, которая запуская автопроверку только если активен флаг
"auto_check_enabled
function! AutoCheck()
    if g:auto_check_enabled
        if &filetype == 'cs'
            OmniSharpGlobalCodeCheck
        elseif &filetype == 'python'
            call PythonCodeCheck()
        endif
        sleep 500m
        call HighlightQuickfixErrors()
    endif
endfunction

    function! PythonCodeCheck()
        " Проверка синтаксиса без запуска
        " " Получаем диагностику LSP
        call setloclist (0, [], 'r')
        :LspDocumentDiagnostics

        " Ждем завершения
        sleep 500m
        lclose

        let errors = []
        " ПРОСТО КОПИРУЕМ ВСЕ ЗАПИСИ ИЗ LOCATION LIST В QUICKFIX
        for item in getloclist(0)
            if item.text =~? 'error'
                " СОЗДАЕМ ЗАПИСЬ С ТИПОМ 'E' (ERROR)
                let error_item = copy(item)
                let error_item.type = 'e'
                call add(errors, error_item)
            else
                let error_item = copy(item)
                let error_item.type = 'w'
                call add(errors, error_item)
            endif
        endfor
        if !empty(errors)
            call setqflist(errors)
            echo "Найдено ошибок: " . len(errors)
        else
            echo "✅ Ошибок нет!"
        endif
    endfunction

function! RunInTerminal()
    " Проверяем если уже открыт терминал - закрываем его
    for win in range(1, winnr('$'))
        if getwinvar(win, '&buftype') == 'terminal'
            execute win . 'wincmd w'
            bdelete!
            return
        endif
    endfor

    let filetype = &filetype
    let filename = expand('%')
    let previous_buffer = bufnr('#')
    " Определяем команду запуска по типу файла
    if filetype == 'python'
        let cmd = 'python3 ' . filename
        let Parser = function('ParsePythonErrors')
    elseif filetype == 'cs'
        let cmd = 'dotnet run'
        let Parser = function('ParseCSharpErrors') 
    else
        echo "Неизвестный тип файла: " . filetype
        return
    endif
    
    " Запускаем в терминале
    execute 'botright terminal ' . cmd
    wincmd w
    let output = system(cmd . ' 2>&1')
    call Parser(output)
endfunction

    function! ParseCSharpErrors(output)
        let errors = []
        
        for line in split(a:output, '\n')
            " Парсим runtime исключения (DivideByZeroException и т.д.)
            if line =~ 'Exception:'
                let exception_match = matchlist(line, '\(.*Exception\): \(.*\)')
                if !empty(exception_match)
                    " Ищем строку с файлом и номером строки (следующая строка)
                    let next_lines = split(a:output, '\n')
                    let next_line = get(next_lines, index(next_lines, line) + 1, '')
                    let file_match = matchlist(next_line, 'at .* in \(.*\):line \(\d\+\)')
                    
                    if !empty(file_match)
                        call add(errors, {
                            \ 'filename': file_match[1],
                            \ 'lnum': file_match[2],
                            \ 'type': 'e',
                            \ 'col': 1,
                            \ 'text': 'CSHARP RUNTIME: ' . exception_match[1] . ' - ' . exception_match[2]
                        \})
                    endif
                endif
            
            " Парсим compile-time ошибки (старый вариант)
            elseif line =~ 'error CS'
                let file_match = matchlist(line, '\(.*\)(\(\d\+\),\(\d\+\)): error CS\(\d\+\): \(.*\)')
                if !empty(file_match)
                    call add(errors, {
                        \ 'filename': file_match[1],
                        \ 'lnum': file_match[2],
                        \ 'type': 'e',
                        \ 'col': file_match[3],
                        \ 'text': 'CSHARP COMPILE: CS' . file_match[4] . ' ' . file_match[5]
                    \})
                endif
            endif
        endfor
        
        if !empty(errors)
            call setqflist(errors)
        endif
    endfunction

    function! ParsePythonErrors(output)
        let errors = []
        let lines = split(a:output, '\n')
        let i = 0
        
        while i < len(lines)
            let line = lines[i]
            
            " Ищем строку с File "...", line XXX
            if line =~ 'File "'
                let file_match = matchlist(line, 'File "\([^"]*\)", line \(\d\+\)')
                if !empty(file_match)
                    let filename = file_match[1]
                    let lnum = file_match[2]
                    for line in lines[i:]
                        if line =~? 'error'
                            break
                        endif
                        let i += 1
                    endfor
                    let error_line = get(lines, i, 'Unparseble error')
                    call add(errors, {
                        \ 'filename': filename,
                        \ 'bufnr': bufnr (filename),
                        \ 'lnum': lnum,
                        \ 'col': 1,
                        \ 'text': 'PYTHON: ' . error_line,
                        \ 'type': 'e'
                    \})
                endif
            endif
            let i += 1
        endwhile
        
        call setqflist(errors)
    endfunction

"Функция автоформатирования скобок при нажатии enter между ними
function! SmartEnterBetweenBrackets()
    let line = getline('.')
    let col = col('.') - 1
    
    " Проверяем что стоим между скобками
    if col > 0 && col < len(line)
        let char_before = line[col-1]
        let char_after = line[col]
        
        if (char_before == '(' && char_after == ')') ||
         \ (char_before == '[' && char_after == ']') ||
         \ (char_before == '{' && char_after == '}')
            
            " Умный перенос с учетом что мы в insert mode
            call feedkeys("\<Left>\<CR>", 'n')  "Ставим открывающую скобку
            call feedkeys("\<Right>\<CR>\<CR>", 'n')   "Ставим закрывающую скобку
            call feedkeys("\<Up>\<Tab>", 'n')  "Ставим каретку
            return ''
        endif
    endif
    
    " Обычный Enter
    return "\<CR>"
endfunction

"Мб стоит захоткеить OmniCsharpRepeatCodeAction
