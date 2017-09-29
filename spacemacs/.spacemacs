;; -*- mode: emacs-lisp -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

;; Last synced on Spacemacs 200.7
;; Easy syncing can be done with SPC f e D

;; emacs installed with.
;; brew install emacs-plus --with-cocoa --with-gnutls --with-librsvg --with-imagemagick --with-spacemacs-icon --with-dbus


(defun dotspacemacs/layers ()
  "Configuration Layers declaration.
You should not put any user code in this function besides modifying the variable
values."
  (setq-default
   ;; Base distribution to use. This is a layer contained in the directory
   ;; `+distribution'. For now available distributions are `spacemacs-base'
   ;; or `spacemacs'. (default 'spacemacs)
   dotspacemacs-distribution 'spacemacs
   ;; Lazy installation of layers (i.e. layers are installed only when a file
   ;; with a supported type is opened). Possible values are `all', `unused'
   ;; and `nil'. `unused' will lazy install only unused layers (i.e. layers
   ;; not listed in variable `dotspacemacs-configuration-layers'), `all' will
   ;; lazy install any layer that support lazy installation even the layers
   ;; listed in `dotspacemacs-configuration-layers'. `nil' disable the lazy
   ;; installation feature and you have to explicitly list a layer in the
   ;; variable `dotspacemacs-configuration-layers' to install it.
   ;; (default 'unused)
   dotspacemacs-enable-lazy-installation 'unused
   ;; If non-nil then Spacemacs will ask for confirmation before installing
   ;; a layer lazily. (default t)
   dotspacemacs-ask-for-lazy-installation t
   ;; If non-nil layers with lazy install support are lazy installed.
   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '()
   ;; List of configuration layers to load.
   dotspacemacs-configuration-layers
   '(
     vimscript
     nginx
     ;; + completion
     (auto-completion :variables
                   auto-completion-enable-help-tooltip t
                   auto-completion-enable-sort-by-usage t
                   auto-completion-return-key-behavior nil
                   auto-completion-enable-snippets-in-popup t)
     helm

     ;; +themes
     themes-megapack
     (colors :variables
             ;; Can be one of `variables', `all' and `nil'
             colors-colorize-identifiers 'nil)
     ;; +checkers
     syntax-checking
     spell-checking

     ;; +os
     osx

     ;; +tools
     imenu-list
     dash
     (ranger :variables ranger-show-preview t)
     pandoc
     (shell :variables
            shell-enable-smart-eshell t
            shell-default-shell 'eshell)
     docker
     rebox
     systemd
     ;; ycmd

     ;; +lang
     org
     org-brain
     org-trello
     deft
     (markdown :variables
               markdown-live-preview-engine 'vmd)

     yaml
     emacs-lisp
     csv
     asm
     ;; semantic
     (python :variables
             python-test-runner 'pytest
             python-enable-yapf-format-on-save t
             python-sort-imports-on-save t)
     clojure
     (c-c++ :variables
            c-c++-enable-clang-support t)
     (haskell :variables
              ;; haskell-enable-ghc-mod-support t
              ;;haskell-completion-backend 'intero
              )
     erlang
     elixir
     ;; agda
     sml
     lua
     java
     html
     (javascript :variables javascript-disable-tern-port-files nil)
     extra-langs
     sql
     (latex :variables latex-build-command "latex -shell-escape")
     shaders
     rust
     purescript

     ;; +chat
     slack

     ;; +frameworks
     ;; django
     react

     ;; +source-control
     version-control
     git
     github

     ;; +vim
     evil-commentary
     vim-empty-lines
     vinegar

     ;; +misc
     ;; nlinum

     ;; +pair-programming
     floobits

     ;; +web-services
     spotify
     twitter
     search-engine
     (wakatime :variables
               wakatime-cli-path "/Users/tritlo/.pyenv/versions/3.5.1/lib/python3.5/site-packages/wakatime/cli.py"
               wakatime-python-bin "/Users/tritlo/.pyenv/versions/3.5.1/bin/python")

    )
   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages, then consider creating a layer. You can also put the
   ;; configuration in `dotspacemacs/user-config'.
   dotspacemacs-additional-packages
   '(
     cuda-mode
     tern-auto-complete
     (protobuf-mode
      :location
      (recipe :fetcher github
              :repo "google/protobuf"
              :files ("editors/protobuf-mode.el")))
     (promela-mode
      :location
      (recipe :fetcher github
              :repo "rudi/promela-mode"
              :files ("promela-mode.el")))
     (docker-tramp
      :location
      (recipe :fetcher github
              :repo "Tritlo/docker-tramp.el")))
   ;; A list of packages that cannot be updated.
   dotspacemacs-frozen-packages '()
   ;; A list of packages that will not be installed and loaded.
   dotspacemacs-excluded-packages
   '(
     ;; evil-terminal-cursor-changer ; Fixes error when in terminal
     )
   ;; Defines the behaviour of Spacemacs when installing packages.
   ;; Possible values are `used-only', `used-but-keep-unused' and `all'.
   ;; `used-only' installs only explicitly used packages and uninstall any
   ;; unused packages as well as their unused dependencies.
   ;; `used-but-keep-unused' installs only the used packages but won't uninstall
   ;; them if they become unused. `all' installs *all* packages supported by
   ;; Spacemacs and never uninstall them. (default is `used-only')
   dotspacemacs-install-packages 'used-only))

(defun dotspacemacs/init ()
  "Initialization function.
This function is called at the very startup of Spacemacs initialization
before layers configuration.
You should not put any user code in there besides modifying the variable
values."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; If non nil ELPA repositories are contacted via HTTPS whenever it's
   ;; possible. Set it to nil if you have no way to use HTTPS in your
   ;; environment, otherwise it is strongly recommended to let it set to t.
   ;; This variable has no effect if Emacs is launched with the parameter
   ;; `--insecure' which forces the value of this variable to nil.
   ;; (default t)
   dotspacemacs-elpa-https t
   ;; Maximum allowed time in seconds to contact an ELPA repository.
   dotspacemacs-elpa-timeout 5
   ;; If non nil then spacemacs will check for updates at startup
   ;; when the current branch is not `develop'. Note that checking for
   ;; new versions works via git commands, thus it calls GitHub services
   ;; whenever you start Emacs. (default nil)
   dotspacemacs-check-for-update nil
   ;; If non-nil, a form that evaluates to a package directory. For example, to
   ;; use different package directories for different Emacs versions, set this
   ;; to `emacs-version'.
   dotspacemacs-elpa-subdirectory nil

   ;; One of `vim', `emacs' or `hybrid'.
   ;; `hybrid' is like `vim' except that `insert state' is replaced by the
   ;; `hybrid state' with `emacs' key bindings. The value can also be a list
   ;; with `:variables' keyword (similar to layers). Check the editing styles
   ;; section of the documentation for details on available variables.
   ;; (default 'vim)
   dotspacemacs-editing-style '(hybrid
                                :variables
                                hybrid-mode-enable-evilified-state t
                                hybrid-mode-enable-hjkl-bindings t
                                )



   ;; If non nil output loading progress in `*Messages*' buffer. (default nil)
   dotspacemacs-verbose-loading nil
   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed. (default 'official)
   dotspacemacs-startup-banner 'official
   ;; List of items to show in startup buffer or an association list of
   ;; the form `(list-type . list-size)`. If nil then it is disabled.
   ;; Possible values for list-type are:
   ;; `recents' `bookmarks' `projects' `agenda' `todos'."
   ;; List sizes may be nil, in which case
   ;; `spacemacs-buffer-startup-lists-length' takes effect.
   dotspacemacs-startup-lists '((agenda . 5)
                                (recents . 5)
                                (projects . 7))
   ;; True if the home buffer should respond to resize events.
   dotspacemacs-startup-buffer-responsive t
   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'text-mode
   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press <SPC> T n to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes
   '(
     monokai
     ;; zenburn
     leuven
     ;; darkokai
     ;; twilight-anti-bright
     ;; zonokai-red
     ;; moe-dark
     ;; moe-light
     ;; dichromacy
     )
   ;; If non nil the cursor color matches the state color in GUI Emacs.
   dotspacemacs-colorize-cursor-according-to-state t
   ;; Default font, or prioritized list of fonts. `powerline-scale' allows to
   ;; quickly tweak the mode-line size to make separators look not too crappy.
   dotspacemacs-default-font '("PragmataPro"
                               :size 12
                               :weight normal
                               :width normal
                               :powerline-scale 1.0)
   ;; The leader key
   dotspacemacs-leader-key "SPC"
   ;; The key used for Emacs commands (M-x) (after pressing on the leader key).
   ;; (default "SPC")
   dotspacemacs-emacs-command-key "SPC"
   ;; The key used for Vim Ex commands (default ":")
   dotspacemacs-ex-command-key ":"
   ;; The leader key accessible in `emacs state' and `insert state'
   ;; (default "M-m")
   dotspacemacs-emacs-leader-key "M-m"
   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it. (default ",")
   dotspacemacs-major-mode-leader-key ","
   ;; Major mode leader key accessible in `emacs state' and `insert state'.
   ;; (default "C-M-m)
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"
   ;; The key used for Emacs commands (M-x) (after pressing on the leader key).
   ;; (default "SPC")
   dotspacemacs-emacs-command-key "SPC"
   ;; These variables control whether separate commands are bound in the GUI to
   ;; the key pairs C-i, TAB and C-m, RET.
   ;; Setting it to a non-nil value, allows for separate commands under <C-i>
   ;; and TAB or <C-m> and RET.
   ;; In the terminal, these pairs are generally indistinguishable, so this only
   ;; works in the GUI. (default nil)
   dotspacemacs-distinguish-gui-tab t
   ;; If non nil `Y' is remapped to `y$' in Evil states. (default nil)
   dotspacemacs-remap-Y-to-y$ nil
   ;; If non-nil, the shift mappings `<' and `>' retain visual state if used
   ;; there. (default t)
   dotspacemacs-retain-visual-state-on-shift t
   ;; If non-nil, J and K move lines up and down when in visual mode.
   ;; (default nil)
   dotspacemacs-visual-line-move-text nil
   ;; If non nil, inverse the meaning of `g' in `:substitute' Evil ex-command.
   ;; (default nil)
   dotspacemacs-ex-substitute-global nil
   ;; Name of the default layout (default "Default")
   dotspacemacs-default-layout-name "Default"
   ;; If non nil the default layout name is displayed in the mode-line.
   ;; (default nil)
   dotspacemacs-display-default-layout nil
   ;; If non nil then the last auto saved layouts are resume automatically upon
   ;; start. (default nil)
   dotspacemacs-auto-resume-layouts nil
   ;; Size (in MB) above which spacemacs will prompt to open the large file
   ;; literally to avoid performance issues. Opening a file literally means that
   ;; no major mode or minor modes are active. (default is 1)
   dotspacemacs-large-file-size 1
   ;; Location where to auto-save files. Possible values are `original' to
   ;; auto-save the file in-place, `cache' to auto-save the file to another
   ;; file stored in the cache directory and `nil' to disable auto-saving.
   ;; (default 'cache)
   dotspacemacs-auto-save-file-location 'cache
   ;; Maximum number of rollback slots to keep in the cache. (default 5)
   dotspacemacs-max-rollback-slots 5
   ;; If non nil, `helm' will try to minimize the space it uses. (default nil)
   dotspacemacs-helm-resize nil
   ;; If non nil, `helm' will try to minimize the space it uses. (default nil)
   dotspacemacs-helm-resize t
   ;; if non nil, the helm header is hidden when there is only one source.
   ;; (default nil)
   dotspacemacs-helm-no-header t
   ;; define the position to display `helm', options are `bottom', `top',
   ;; `left', or `right'. (default 'bottom)
   dotspacemacs-helm-position 'bottom
   ;; Controls fuzzy matching in helm. If set to `always', force fuzzy matching
   ;; in all non-asynchronous sources. If set to `source', preserve individual
   ;; source settings. Else, disable fuzzy matching in all sources.
   ;; (default 'always)
   dotspacemacs-helm-use-fuzzy 'always
   ;; If non nil the paste transient-state is enabled. When enabled pressing `p`
   ;; several times cycle between the kill ring content. (default nil)
   dotspacemacs-enable-paste-transient-state nil
   ;; Which-key delay in seconds. The which-key buffer is the popup listing
   ;; the commands bound to the current keystroke sequence. (default 0.4)
   dotspacemacs-which-key-delay 0.4
   ;; Which-key frame position. Possible values are `right', `bottom' and
   ;; `right-then-bottom'. right-then-bottom tries to display the frame to the
   ;; right; if there is insufficient space it displays it at the bottom.
   ;; (default 'bottom)
   dotspacemacs-which-key-position 'bottom
   ;; If non nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil to boost the loading time. (default t)
   dotspacemacs-loading-progress-bar t
   ;; If non nil the frame is fullscreen when Emacs starts up. (default nil)
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup nil
   ;; If non nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX. (default nil)
   dotspacemacs-fullscreen-use-non-native nil
   ;; If non nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (default nil) (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup nil
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-active-transparency 90
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-inactive-transparency 90
   ;; If non nil show the titles of transient states. (default t)
   dotspacemacs-show-transient-state-title t
   ;; If non nil show the color guide hint for transient state keys. (default t)
   dotspacemacs-show-transient-state-color-guide t
   ;; If non nil unicode symbols are displayed in the mode line. (default t)
   dotspacemacs-mode-line-unicode-symbols nil
   ;; If non nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters point
   ;; when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling t
   ;; If non nil line numbers are turned on in all `prog-mode' and `text-mode'
   ;; derivatives. If set to `relative', also turns on relative line numbers.
   ;; (default nil)
   dotspacemacs-line-numbers t
   ;; Code folding method. Possible values are `evil' and `origami'.
   ;; (default 'evil)
   dotspacemacs-folding-method 'origami
   ;; If non-nil smartparens-strict-mode will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode nil
   ;; If non-nil pressing the closing parenthesis `)' key in insert mode passes
   ;; over any automatically added closing parenthesis, bracket, quote, etc…
   ;; This can be temporary disabled by pressing `C-q' before `)'. (default nil)
   dotspacemacs-smart-closing-parenthesis t
   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'all
   ;; If non nil, advise quit functions to keep server open when quitting.
   ;; (default nil)
   dotspacemacs-persistent-server nil
   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `ag', `pt', `ack' and `grep'.
   ;; (default '("ag" "pt" "ack" "grep"))
   dotspacemacs-search-tools '("ag" "pt" "ack" "grep")
   ;; The default package repository used if no explicit repository has been
   ;; specified with an installed package.
   ;; Not used for now. (default nil)
   dotspacemacs-default-package-repository nil
   ;; Delete whitespace while saving buffer. Possible values are `all'
   ;; to aggressively delete empty line and long sequences of whitespace,
   ;; `trailing' to delete only the whitespace at end of lines, `changed'to
   ;; delete only whitespace for changed lines or `nil' to disable cleanup.
   ;; (default nil)
   dotspacemacs-whitespace-cleanup 'all
   ))

(defun dotspacemacs/user-init ()
  "Initialization function for user code.
It is called immediately after `dotspacemacs/init', before layer configuration
executes.
 This function is mostly useful for variables that need to be set
before packages are loaded. If you are unsure, you should try in setting them in
`dotspacemacs/user-config' first."

  ; Make sure emacs finds agda and ghc-mode etc.
  (setq frame-title-format '("%b @ " "Spacemacs " spacemacs-version " - Emacs " emacs-version)
        intero-package-version "0.1.19"
        )
  (setq-default
   calendar-latitude +57
   calendar-longitude 12
   vc-follow-symlinks t
   fci-rule-column 120
   global-evil-search-highlight-persist nil
   js2-basic-offset 2
   js-indent-level 2
   speedbar-use-images nil
   markdown-enable-math t
   markdown-command "pandoc -f markdown_github+tex_math_dollars-hard_line_breaks -t html"
   )

)

(defun dotspacemacs/user-config ()
  "Configuration function for user code.
This function is called at the very end of Spacemacs initialization after
layers configuration.
This is the place where most of your configurations should be done. Unless it is
explicitly specified that a variable should be set before a package is loaded,
you should place your code here."
                                        ; (define-key evil-insert-state-map "\C-e" 'end-of-line)

  (evil-define-key 'visual evil-surround-mode-map "s" 'evil-substitute)
  (evil-define-key 'visual evil-surround-mode-map "S" 'evil-surround-region)

  ;;================ Haskell ==========================
  ;; Use the stack ghc-mod file.
  ;; (add-to-list 'load-path "~/.stack/global-project/.stack-work/install/x86_64-linux/lts-3.12/7.10.2/share/x86_64-linux-ghc-7.10.2/ghc-mod-5.4.0.0/elisp/")
  ;; ghc-mod keybinds

  (setq haskell-compile-cabal-build-command "stack build")
  ;; ============================================================
  (setq neo-theme 'ascii)
  (setq neo-show-updir-line t)
  ;; (evil-leader/set-key "tb" 'speedbar)

  (setq linum-format 'dynamic)
  (global-subword-mode 1) ;; camelCaseWords
  (setq
   global-evil-search-highlight-persist nil
   )

  (setq global-prettify-symbols-mode +1)

  ; (setq ispell-dictionary "is")
  ;; (setq-default
  ;;  LaTeX-command "latex -shell-escape"
  ;;  Tex-PDF-mode t)
  ; Better for terminus
  (fancy-battery-mode)
  (eval-after-load "tex"
    '(add-to-list 'TeX-command-list
                  '("Arara" "arara %s" TeX-run-TeX nil t :help "Run Arara.")))

  ;; clojure
  ;; (eval-after-load 'flycheck
  ;;   '(setq flycheck-display-errors-function #'flycheck-pos-tip-error-messages))
  ;; (eval-after-load 'flycheck '(flycheck-clojure-setup))
  ;; (add-hook 'clojure-mode-hook #'flycheck-mode)
  ;; (add-hook 'clojure-mode-hook #'subword-mode)

  ;; agda
  ;; (setq agda2-include-dirs '("." "./stdlib/src"))

  ;; (add-hook 'haskell-mode-hook (lambda ()
  ;;                                (spacemacs/set-leader-keys-for-major-mode 'haskell-mode
  ;;                                  "hi" 'ghc-show-info
  ;;                                  "ht" 'ghc-show-type
  ;;                                  ;; "hi"  (lookup-key haskell-mode-map (kbd "C-c TAB"))
  ;;                                  ;; "ht"  (lookup-key haskell-mode-map (kbd "C-c C-t"))
  ;;                                  )))

  ;; (mac-auto-operator-composition-mode)

  ;;; helm-dash
  (setq helm-dash-browser-func 'eww)
  (setq helm-dash-enable-debugging nil)

  ;; eclim
  (setq eclim-executable "/opt/homebrew-cask/Caskroom/eclipse-java/4.5.2/Eclipse.app/Contents/Eclipse/eclim"
        eclim-eclipse-dirs '("/opt/homebrew-cask/Caskroom/eclipse-java/4.5.2/Eclipse.app/Contents/Eclipse/"))
  (require 'eclimd)

  ;; Add initialize magit, so that
  ;; it's bindings work in commit messages.
  (require  'magit)

  ;; Make possible to ssh into ash
  (setq docker-tramp-use-names t)

  ;; make ligatures work
  (let ((alist '(
                 (33 . ".\\(?:\\(?:==\\|!!\\)\\|[!=]\\)")
                 (35 . ".\\(?:###\\|##\\|_(\\|[#(?[_{]\\)")
                 (36 . ".\\(?:>\\)")
                 (37 . ".\\(?:\\(?:%%\\)\\|%\\)")
                 (38 . ".\\(?:\\(?:&&\\)\\|&\\)")
                 (42 . ".\\(?:\\(?:\\*\\*/\\)\\|\\(?:\\*[*/]\\)\\|[*/>]\\)")
                 (43 . ".\\(?:\\(?:\\+\\+\\)\\|[+>]\\)")
                 ;; These make SPC : freeze for some reason
                 ;; (45 . ".\\(?:\\(?:-[>-]\\|<<\\|>>\\)\\|[<>}~-]\\)")
                 ;; (46 . ".\\(?:\\(?:\\.[.<]\\)\\|[.=-]\\)")
                 (47 . ".\\(?:\\(?:\\*\\*\\|//\\|==\\)\\|[*/=>]\\)")
                 (48 . ".\\(?:x[a-zA-Z]\\)")
                 (58 . ".\\(?:::\\|[:=]\\)")
                 (59 . ".\\(?:;;\\|;\\)")
                 (60 . ".\\(?:\\(?:!--\\)\\|\\(?:~~\\|->\\|\\$>\\|\\*>\\|\\+>\\|--\\|<[<=-]\\|=[<=>]\\||>\\)\\|[*$+~/<=>|-]\\)")
                 (61 . ".\\(?:\\(?:/=\\|:=\\|<<\\|=[=>]\\|>>\\)\\|[<=>~]\\)")
                 (62 . ".\\(?:\\(?:=>\\|>[=>-]\\)\\|[=>-]\\)")
                 (63 . ".\\(?:\\(\\?\\?\\)\\|[:=?]\\)")
                 (91 . ".\\(?:]\\)")
                 (92 . ".\\(?:\\(?:\\\\\\\\\\)\\|\\\\\\)")
                 (94 . ".\\(?:=\\)")
                 (119 . ".\\(?:ww\\)")
                 (123 . ".\\(?:-\\)")
                 (124 . ".\\(?:\\(?:|[=|]\\)\\|[=>|]\\)")
                 (126 . ".\\(?:~>\\|~~\\|[>=@~-]\\)")
                 )))
    (dolist (char-regexp alist)
      (set-char-table-range composition-function-table (car char-regexp)
                            `([,(cdr char-regexp) 0 font-shape-gstring]))))

  (setq
   powerline-default-separator 'utf-8
   powerline-utf-8-separator-left #xe0b0
   powerline-utf-8-separator-right #xe0b2
   spaceline-window-numbers-unicode t
   spaceline-workspace-numbers-unicode t
   )
  (spaceline-compile)


  (autoload 'promela-mode "promela-mode" "PROMELA mode" nil t)
  (setq auto-mode-alist
        (append
          (list (cons "\\.promela$"  'promela-mode)
          (cons "\\.spin$"     'promela-mode)
          (cons "\\.pml$"      'promela-mode))
          auto-mode-alist))

  (add-to-list 'auto-mode-alist '( "\\.zsh-theme\\'" . shell-script-mode))

  ;; (setq py-yapf-options "--style=chromium")

  (load-file "~/.slack")
  (load-file "~/.trello.mpgis.el")

  (setq ycmd-server-command (list "python" (file-truename "~/YouCompleteMe/ycmd")))
  (setq ycmd-force-semantic-completion t)


  (setq org-directory "~/Dropbox/Org")
  (setq deft-directory (expand-file-name "brain" org-directory))


  (add-hook 'org-mode-hook
            (lambda ()  (cond ((string-prefix-p (expand-file-name "trello/" org-directory)  buffer-file-name)
                               (org-trello-mode 1)))))

  ;; (setq exec-path (add-to-list 'exec-path "~/.nvm/versions/node/v7.4.0/bin/"))
  ;; (setq exec-path (add-to-list 'exec-path "~/.local/bin/"))

  ;; XKCD timetravel
  (with-eval-after-load 'undo-tree
    (define-key undo-tree-map (kbd "<M-S-triple-wheel-down>") 'undo-tree-redo)
    (define-key undo-tree-map (kbd "<M-S-triple-wheel-up>") 'undo-tree-undo))

  (with-eval-after-load 'git-timemachine
    (define-key git-timemachine-mode-map (kbd "<C-S-triple-wheel-down>") 'git-timemachine-show-previous-revision)
    (define-key git-timemachine-mode-map (kbd "<C-S-triple-wheel-up>") 'git-timemachine-show-next-revision))
)

;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(evil-want-Y-yank-to-eol nil)
 '(magit-diff-use-overlays nil)
 '(org-agenda-files
   (quote
    ("~/Dropbox/Org/trello/Org.org" "~/Dropbox/Org/Vinna.org" "~/Dropbox/Org/Skóli.org" "~/Dropbox/Org/Agenda.org")))
 '(org-trello-current-prefix-keybinding "C-c o")
 '(package-selected-packages
   (quote
    (wakatime-mode ob-sml sml-mode vi-tilde-fringe evil-nerd-commenter define-word org-trello ob-elixir flycheck-credo inflections edn paredit peg cider queue clojure-mode rust-mode elixir-mode deft org-brain winum solarized-theme madhat2r-theme fuzzy twilight-anti-bright-theme-theme autothemer tern-auto-complete vimrc-mode dactyl-mode hide-comnt psci purescript-mode psc-ide nginx-mode markdown-mode linum-relative skewer-mode simple-httpd multiple-cursors js2-mode flycheck-ycmd company-ycmd ycmd request-deferred deferred ghc powerline emojify circe oauth2 websocket spinner org nlinum hydra parent-mode multi projectile request haml-mode gitignore-mode fringe-helper git-gutter+ git-gutter gh marshal logito pcache ht flyspell-correct seq haskell-mode flycheck pkg-info epl flx magit git-commit with-editor smartparens iedit anzu evil goto-chg undo-tree eval-sexp-fu highlight json-mode tablist magit-popup docker-tramp json-snatcher json-reformat diminish web-completion-data dash-functional tern pos-tip eclim anaconda-mode pythonic f s company bind-map bind-key yasnippet packed dash auctex alert log4e gntp helm avy helm-core async auto-complete popup package-build pug-mode zonokai-theme zenburn-theme zen-and-art-theme yapfify yaml-mode xterm-color x86-lookup ws-butler wolfram-mode window-numbering which-key web-mode web-beautify volatile-highlights vmd-mode uuidgen use-package underwater-theme ujelly-theme twittering-mode twilight-theme twilight-bright-theme twilight-anti-bright-theme tronesque-theme toxi-theme toml-mode toc-org thrift tao-theme tangotango-theme tango-plus-theme tango-2-theme tagedit systemd sunny-day-theme sublime-themes subatomic256-theme subatomic-theme stekene-theme stan-mode sql-indent spotify spacemacs-theme spaceline spacegray-theme soothe-theme soft-stone-theme soft-morning-theme soft-charcoal-theme smyx-theme smeargle slim-mode slack shell-pop seti-theme scss-mode scad-mode sass-mode reverse-theme reveal-in-osx-finder restart-emacs rebox2 ranger rainbow-mode rainbow-identifiers rainbow-delimiters railscasts-theme racer quelpa qml-mode pyvenv pytest pyenv-mode py-isort purple-haze-theme protobuf-mode promela-mode professional-theme popwin planet-theme pip-requirements phoenix-dark-pink-theme phoenix-dark-mono-theme persp-mode pcre2el pbcopy pastels-on-dark-theme paradox pandoc-mode ox-pandoc osx-trash osx-dictionary origami orgit organic-green-theme org-projectile org-present org-pomodoro org-plus-contrib org-download org-bullets open-junk-file omtose-phellack-theme oldlace-theme occidental-theme obsidian-theme noctilux-theme nlinum-relative niflheim-theme neotree nasm-mode naquadah-theme mustang-theme multi-term move-text monokai-theme monochrome-theme molokai-theme moe-theme mmm-mode minimal-theme matlab-mode material-theme markdown-toc majapahit-theme magit-gitflow magit-gh-pulls macrostep lush-theme lua-mode lorem-ipsum livid-mode live-py-mode link-hint light-soap-theme less-css-mode launchctl julia-mode js2-refactor js-doc jbeans-theme jazz-theme jade-mode ir-black-theme intero inkpot-theme info+ indent-guide imenu-list ido-vertical-mode hy-mode hungry-delete htmlize hlint-refactor hl-todo hindent highlight-parentheses highlight-numbers highlight-indentation heroku-theme hemisu-theme help-fns+ helm-themes helm-swoop helm-spotify helm-pydoc helm-projectile helm-mode-manager helm-make helm-hoogle helm-gitignore helm-flx helm-descbinds helm-dash helm-css-scss helm-company helm-c-yasnippet helm-ag hc-zenburn-theme haskell-snippets gruvbox-theme gruber-darker-theme grandshell-theme gotham-theme google-translate golden-ratio gnuplot glsl-mode github-search github-clone github-browse-file gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link git-gutter-fringe git-gutter-fringe+ gist gh-md gandalf-theme flyspell-correct-helm flycheck-rust flycheck-pos-tip flycheck-mix flycheck-haskell flx-ido floobits flatui-theme flatland-theme firebelly-theme fill-column-indicator farmhouse-theme fancy-battery eyebrowse expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-mc evil-matchit evil-magit evil-lisp-state evil-indent-plus evil-iedit-state evil-exchange evil-escape evil-ediff evil-commentary evil-args evil-anzu espresso-theme eshell-z eshell-prompt-extras esh-help erlang engine-mode emmet-mode elisp-slime-nav dumb-jump dracula-theme dockerfile-mode docker django-theme disaster diff-hl dash-at-point darktooth-theme darkokai-theme darkmine-theme darkburn-theme dakrone-theme cython-mode cyberpunk-theme cuda-mode csv-mode company-web company-tern company-statistics company-quickhelp company-ghci company-ghc company-emacs-eclim company-cabal company-c-headers company-auctex company-anaconda column-enforce-mode colorsarenice-theme color-theme-sanityinc-tomorrow color-theme-sanityinc-solarized color-identifiers-mode coffee-mode cmm-mode cmake-mode clues-theme clojure-snippets clj-refactor clean-aindent-mode clang-format cider-eval-sexp-fu cherry-blossom-theme cargo busybee-theme bubbleberry-theme birds-of-paradise-plus-theme badwolf-theme auto-yasnippet auto-highlight-symbol auto-dictionary auto-compile arduino-mode apropospriate-theme anti-zenburn-theme ample-zen-theme ample-theme alect-themes alchemist aggressive-indent afternoon-theme adaptive-wrap ace-window ace-link ace-jump-helm-line ac-ispell)))
 '(paradox-github-token t)
 '(psc-ide-add-import-on-completion t t)
 '(psc-ide-rebuild-on-save nil t)
 '(ring-bell-function (quote ignore)))
;; (custom-set-faces
;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 ;; '(default ((((class color) (min-colors 257)) (:foreground "#F8F8F2" :background "#272822")) (((class color) (min-colors 89)) (:foreground "#F5F5F5" :background "#1B1E1C")))))
