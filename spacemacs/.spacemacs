;; -*- mode: emacs-lisp -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

;; Last synced on Spacemacs 105.11
;; Easy syncing can be done with SPC f e D

(defun dotspacemacs/layers ()
  "Configuration Layers declaration.
You should not put any user code in this function besides modifying the variable
values."
  (setq-default
   ;; Base distribution to use. This is a layer contained in the directory
   ;; `+distribution'. For now available distributions are `spacemacs-base'
   ;; or `spacemacs'. (default 'spacemacs)
   dotspacemacs-distribution 'spacemacs
   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '()
   ;; List of configuration layers to load. If it is the symbol `all' instead
    ;; of a list then all discovered layers will be installed.
    dotspacemacs-configuration-layers
    '(
        ;; ----------------------------------------------------------------
        ;; Example of useful layers you may want to use right away.
        ;; Uncomment some layer names and press <SPC f e R> (Vim style) or
        ;; <M-m f e R> (Emacs style) to install them.
        ;; ----------------------------------------------------------------
        (auto-completion :variables
                      auto-completion-enable-help-tooltip t
                      auto-completion-enable-sort-by-usage t
                      auto-completion-enable-snippets-in-popup t)
        ;; themes-megapack

        syntax-checking
        spell-checking
        (colors :variables colors-enable-rainbow-identifiers t)

        ;; i3 like Workspaces with SPC W
        eyebrowse
        ;; perspective


        ;; Mac
        osx
        ;; ----------------------------------------------------------------
        ;; Tools
        ;; ----------------------------------------------------------------

        ; wakatime
        (ranger :variables ranger-show-preview t)

        (shell :variables
               shell-enable-smart-eshell 'nil
               shell-default-shell 'eshell)

        ;; Manage services from emacs
        ;; prodigy
        org

        pandoc

        ;; ----------------------------------------------------------------
        ;; Languages
        ;; ----------------------------------------------------------------
        markdown
        yaml
        emacs-lisp
        ;; semantic
        (python :variables
                python-test-runner 'pytest
                python-enable-yapf-format-on-save t
                )
        clojure
        (c-c++ :variables
               c-c++-enable-clang-support t
               )
        (haskell :variables
                 haskell-enable-ghc-mod-support t
                 ; haskell-enable-shm-support t
                 )
        erlang
        elixir
        ;; agda
        lua
        java
        html
        javascript
        extra-langs
        dockerfile
        ;; sql
        (latex :variables latex-build-command "latex -shell-escape")

        ;; ----------------------------------------------------------------
        ;; Frameworks
        ;; ----------------------------------------------------------------
        ;; django
        react

        ;; ----------------------------------------------------------------
        ;; Source-control
        ;; ----------------------------------------------------------------
        version-control
        git
        github

        ;; ----------------------------------------------------------------
        ;; Vim
        ;; ----------------------------------------------------------------
        evil-commentary
        unimpaired
        ; vim-empty-lines
        ; vinegar

        ;; ----------------------------------------------------------------
        ;; Misc
        ;; ----------------------------------------------------------------
        ;; ibuffer
        floobits
        spotify
        speed-reading
        command-log
        dash

        ;; Fun
        ;; selectric
        ;; games

        )
   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages then consider to create a layer, you can also put the
   ;; configuration in `dotspacemacs/config'.
   ;; dotspacemacs-additional-packages '(flycheck-clojure flycheck-pos-tip)
    dotspacemacs-additional-packages '()
   ;; A list of packages and/or extensions that will not be install and loaded.
   dotspacemacs-excluded-packages '(
                                    ;; evil-terminal-cursor-changer ; Fixes error when in terminal
                                    )
   ;; If non-nil spacemacs will delete any orphan packages, i.e. packages that
   ;; are declared in a layer which is not a member of
   ;; the list `dotspacemacs-configuration-layers'. (default t)
   dotspacemacs-delete-orphan-packages t))

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
   ;; when the current branch is not `develop'. (default t)
   dotspacemacs-check-for-update t
   ;; One of `vim', `emacs' or `hybrid'. Evil is always enabled but if the
   ;; variable is `emacs' then the `holy-mode' is enabled at startup. `hybrid'
   ;; uses emacs key bindings for vim's insert mode, but otherwise leaves evil
   ;; unchanged. (default 'vim)
   dotspacemacs-editing-style 'hybrid
   ;; If non nil output loading progress in `*Messages*' buffer. (default nil)
   dotspacemacs-verbose-loading nil
   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed. (default 'official)
   dotspacemacs-startup-banner 'official
   ;; List of items to show in the startup buffer. If nil it is disabled.
   ;; Possible values are: `recents' `bookmarks' `projects'.
   ;; (default '(recents projects))
   dotspacemacs-startup-lists '(recents projects)
   ;; Number of recent files to show in the startup buffer. Ignored if
   ;; `dotspacemacs-startup-lists' doesn't include `recents'. (default 5)
   dotspacemacs-startup-recent-list-size 5
   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'text-mode
   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press <SPC> T n to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(spacemacs-dark
                         spacemacs-light
                         solarized-light
                         solarized-dark
                         leuven
                         monokai
                         zenburn)
   ;; If non nil the cursor color matches the state color in GUI Emacs.
   dotspacemacs-colorize-cursor-according-to-state t
   ;; Default font. `powerline-scale' allows to quickly tweak the mode-line
   ;; size to make separators look not too crappy.
   dotspacemacs-default-font '("Pragmata Pro"
                               :size 12
                               :weight normal
                               :width normal
                               :powerline-scale 2.0)
   ;; The leader key
   dotspacemacs-leader-key "SPC"
   ;; The leader key accessible in `emacs state' and `insert state'
   ;; (default "M-m")
   dotspacemacs-emacs-leader-key "M-m"
   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it. (default ",")
   dotspacemacs-major-mode-leader-key ","
   ;; Major mode leader key accessible in `emacs state' and `insert state'.
   ;; (default "C-M-m)
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"
   ;; These variables control whether separate commands are bound in the GUI to
   ;; the key pairs C-i, TAB and C-m, RET.
   ;; Setting it to a non-nil value, allows for separate commands under <C-i>
   ;; and TAB or <C-m> and RET.
   ;; In the terminal, these pairs are generally indistinguishable, so this only
   ;; works in the GUI. (default nil)
   dotspacemacs-distinguish-gui-tab nil
   ;; (Not implemented) dotspacemacs-distinguish-gui-ret nil
   ;; The command key used for Evil commands (ex-commands) and
   ;; Emacs commands (M-x).
   ;; By default the command key is `:' so ex-commands are executed like in Vim
   ;; with `:' and Emacs commands are executed with `<leader> :'.
   dotspacemacs-command-key ":"
   ;; If non nil `Y' is remapped to `y$'. (default t)
   dotspacemacs-remap-Y-to-y$ t
   ;; Name of the default layout (default "Default")
   dotspacemacs-default-layout-name "Default"
   ;; If non nil the default layout name is displayed in the mode-line.
   ;; (default nil)
   dotspacemacs-display-default-layout t
   ;; If non nil then the last auto saved layouts are resume automatically upon
   ;; start. (default nil)
   dotspacemacs-auto-resume-layouts nil
   ;; Location where to auto-save files. Possible values are `original' to
   ;; auto-save the file in-place, `cache' to auto-save the file to another
   ;; file stored in the cache directory and `nil' to disable auto-saving.
   ;; (default 'cache)
   dotspacemacs-auto-save-file-location 'cache
   ;; Maximum number of rollback slots to keep in the cache. (default 5)
   dotspacemacs-max-rollback-slots 5
   ;; If non nil then `ido' replaces `helm' for some commands. For now only
   ;; `find-files' (SPC f f), `find-spacemacs-file' (SPC f e s), and
   ;; `find-contrib-file' (SPC f e c) are replaced. (default nil)
   dotspacemacs-use-ido nil
   ;; If non nil, `helm' will try to minimize the space it uses. (default nil)
   dotspacemacs-helm-resize nil
   ;; if non nil, the helm header is hidden when there is only one source.
   ;; (default nil)
   dotspacemacs-helm-no-header t
   ;; define the position to display `helm', options are `bottom', `top',
   ;; `left', or `right'. (default 'bottom)
   dotspacemacs-helm-position 'bottom
   ;; If non nil the paste micro-state is enabled. When enabled pressing `p`
   ;; several times cycle between the kill ring content. (default nil)
   dotspacemacs-enable-paste-micro-state nil
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
   ;; If non nil unicode symbols are displayed in the mode line. (default t)
   dotspacemacs-mode-line-unicode-symbols t
   ;; If non nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters the
   ;; point when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling t
   ;; If non nil line numbers are turned on in all `prog-mode' and `text-mode'
   ;; derivatives. If set to `relative', also turns on relative line numbers.
   ;; (default nil)
   dotspacemacs-line-numbers t
   ;; If non-nil smartparens-strict-mode will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode nil
   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'all
   ;; If non nil advises quit functions to keep server open when quitting.
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
It is called immediately after `dotspacemacs/init'.  You are free to put almost
any user code here.  The exception is org related code, which should be placed
in `dotspacemacs/user-config'."
  ; (setq waktime-python-bin "/usr/bin/python")

  ; Make sure emacs finds agda and ghc-mode etc.
  (add-to-list 'exec-path "~/.local/bin/")
  (setq frame-title-format '("%b @ " "Spacemacs " spacemacs-version " - Emacs " emacs-version ))
  (setq-default
   vc-follow-symlinks t
   fci-rule-column 80
   global-evil-search-highlight-persist nil
   js2-basic-offset 2
   js-indent-level 2
   ;; evil-toggle-key "C-M-z"
   ;; wakatime-api-key "***REMOVED***"
   ;; wakatime-cli-path "/usr/local/bin/wakatime"
   ;; waktime-python-bin "/usr/bin/python"
   speedbar-use-images nil
   )
  )

(defun dotspacemacs/user-config ()
  "Configuration function for user code.
 This function is called at the very end of Spacemacs initialization after
  layers configuration. You are free to put any user code."
  ; (define-key evil-insert-state-map "\C-e" 'end-of-line)
  (evil-define-key 'visual evil-surround-mode-map "s" 'evil-substitute)
  (evil-define-key 'visual evil-surround-mode-map "S" 'evil-surround-region)

  ;;================ Haskell ==========================
  ;; Use the stack ghc-mod file.
  ;; (add-to-list 'load-path "~/.stack/global-project/.stack-work/install/x86_64-linux/lts-3.12/7.10.2/share/x86_64-linux-ghc-7.10.2/ghc-mod-5.4.0.0/elisp/")
  ;; ghc-mod keybinds

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
  ;; (setq powerline-default-separator 'arrow-fade)
  (fancy-battery-mode)
  (eval-after-load "tex"
    '(add-to-list 'TeX-command-list
                  '("Arara" "arara %s" TeX-run-TeX nil t :help "Run Arara.")))

  (spacemacs/toggle-smooth-scrolling-on)
  ;; clojure
  ;; (eval-after-load 'flycheck
  ;;   '(setq flycheck-display-errors-function #'flycheck-pos-tip-error-messages))
  ;; (eval-after-load 'flycheck '(flycheck-clojure-setup))
  ;; (add-hook 'clojure-mode-hook #'flycheck-mode)
  ;; (add-hook 'clojure-mode-hook #'subword-mode)

  ;; agda
  ;; (setq agda2-include-dirs '("." "./stdlib/src"))

  (add-hook 'haskell-mode-hook (lambda ()
                                 (spacemacs/set-leader-keys-for-major-mode 'haskell-mode
                                   "hi" 'ghc-show-info
                                   "ht" 'ghc-show-type
                                   ;; "hi"  (lookup-key haskell-mode-map (kbd "C-c TAB"))
                                   ;; "ht"  (lookup-key haskell-mode-map (kbd "C-c C-t"))
                                   )))

  (mac-auto-operator-composition-mode)

  ;;; helm-dash
  (setq helm-dash-browser-func 'eww)
  (setq helm-dash-enable-debugging nil)

  ;; eclim
  (setq eclim-executable "/opt/homebrew-cask/Caskroom/eclipse-java/4.5.2/Eclipse.app/Contents/Eclipse/eclim")
  (setq eclimd-executable "/opt/homebrew-cask/Caskroom/eclipse-java/4.5.2/Eclipse.app/Contents/Eclipse/eclimd")
  (setq eclim-eclipse-dirs '("/opt/homebrew-cask/Caskroom/eclipse-java/4.5.2/Eclipse.app/Contents/Eclipse/"))

  )

;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(magit-diff-use-overlays nil)
 '(paradox-github-token t)
 '(ring-bell-function (quote ignore) t)
 )
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Hack" :foundry "nil" :slant normal :weight normal :height 120 :width normal))))
 '(company-tooltip-common ((t (:inherit company-tooltip :weight bold :underline nil))))
 '(company-tooltip-common-selection ((t (:inherit company-tooltip-selection :weight bold :underline nil)))))
