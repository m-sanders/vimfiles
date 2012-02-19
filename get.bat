CALL git init
CALL git add .
CALL git commit -m "initial commit"
CALL git submodule add http://github.com/tpope/vim-fugitive.git bundle/fugitive
CALL git add .
CALL git commit -m "install Fugitive.vim bundle as a submodule."
CALL git submodule add http://github.com/msanders/snipmate.vim.git bundle/snipmate
CALL git add .
CALL git commit -m "install snippet.vim bundle as a submodule."
CALL git submodule add http://github.com/tpope/vim-surround.git bundle/surround
CALL git add .
CALL git commit -m "install surround.vim bundle as a submodule."
CALL git submodule add http://github.com/tpope/vim-git.git bundle/git
CALL git add .
CALL git commit -m "install git.vim bundle as a submodule."
CALL git submodule add http://github.com/ervandew/supertab.git bundle/supertab
CALL git add .
CALL git commit -m "install supertab.vim bundle as a submodule."
CALL git submodule add http://github.com/sontek/minibufexpl.vim.git bundle/minibufexpl
CALL git add .
CALL git commit -m "install minibufferexpl.vim bundle as a submodule."
CALL git submodule add http://github.com/wincent/Command-T.git bundle/command-t
CALL git add .
CALL git commit -m "install command-t.vim bundle as a submodule."
CALL git submodule add http://github.com/mitechie/pyflakes-pathogen.git
CALL git add .
CALL git commit -m "install pyflakes-pathogen.vim bundle as a submodule."
CALL git submodule add http://github.com/mileszs/ack.vim.git bundle/ack
CALL git add .
CALL git commit -m "install ack.vim bundle as a submodule."
CALL git submodule add http://github.com/sjl/gundo.vim.git bundle/gundo
CALL git add .
CALL git commit -m "install gundo.vim bundle as a submodule."
CALL git submodule add http://github.com/fs111/pydoc.vim.git bundle/pydoc
CALL git add .
CALL git commit -m "install pydoc.vim bundle as a submodule."
CALL git submodule add http://github.com/vim-scripts/pep8.git bundle/pep8
CALL git add .
CALL git commit -m "install oeo8.vim bundle as a submodule."
CALL git submodule add http://github.com/alfredodeza/pytest.vim.git bundle/py.test
CALL git add .
CALL git commit -m "install pytest.vim bundle as a submodule."
CALL git submodule add http://github.com/reinh/vim-makegreen bundle/makegreen
CALL git add .
CALL git commit -m "install makegreen.vim bundle as a submodule."
CALL git submodule add http://github.com/vim-scripts/TaskList.vim.git bundle/tasklist
CALL git add .
CALL git commit -m "install tasklisk.vim bundle as a submodule."
CALL git submodule add http://github.com/vim-scripts/The-NERD-tree.git bundle/nerdtree
CALL git add .
CALL git commit -m "install nerdtree.vim bundle as a submodule."
CALL git submodule add http://github.com/sontek/rope-vim.git bundle/ropevim
CALL git add .
CALL git commit -m "install ropevim.vim bundle as a submodule."

