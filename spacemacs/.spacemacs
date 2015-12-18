;; -*- mode: emacs-lisp -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

;; Last synced on Spacemacs 104.8
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
        perspectives

        ;; Fun
        games

        ;; ----------------------------------------------------------------
        ;; Tools
        ;; ----------------------------------------------------------------

        wakatime
        (ranger :variables ranger-show-preview t)

        (shell :variables
               shell-enable-smart-eshell t
               shell-default-shell 'eshell)

        ;; Manage services from emacs
        ;; prodigy

        ;; ----------------------------------------------------------------
        ;; Languages
        ;; ----------------------------------------------------------------
        markdown
        yaml
        emacs-lisp
        ;; semantic
        (python :variables
                python-test-runner 'pytest
                ; python-enable-yapf-format-on-save t
                )
        clojure
        (c-c++ :variables
               c-c++-enable-clang-support t
               )
        (haskell :variables
                 haskell-enable-ghc-mod-support t
                 ; haskell-enable-shm-support t
                 )
        ;; agda
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
        spotify

        ;; Collaborative editig, see floobits.org
        ;; floobits
        )
   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages then consider to create a layer, you can also put the
   ;; configuration in `dotspacemacs/config'.
    dotspacemacs-additional-packages '(
                                       flycheck-clojure
                                       flycheck-pos-tip
                                       )
   ;; A list of packages and/or extensions that will not be install and loaded.
   dotspacemacs-excluded-packages '(
                                    evil-terminal-cursor-changer ; Fixes error when in terminal
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
   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press <SPC> T n to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(spacemacs-dark
                         spacemacs-light
                         solarized-light
                         solarized-dark
                         leuven
                         monokai
                         zenburn
                         gotham)
   ;; If non nil the cursor color matches the state color.
   dotspacemacs-colorize-cursor-according-to-state t
   ;; Default font. `powerline-scale' allows to quickly tweak the mode-line
   ;; size to make separators look not too crappy.
   dotspacemacs-default-font '("Hack"
                               :size 12
                               :weight normal
                               :width normal
                               :powerline-scale 1.2)
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
   ;; The command key used for Evil commands (ex-commands) and
   ;; Emacs commands (M-x).
   ;; By default the command key is `:' so ex-commands are executed like in Vim
   ;; with `:' and Emacs commands are executed with `<leader> :'.
   dotspacemacs-command-key ":"
   ;; If non nil `Y' is remapped to `y$'. (default t)
   dotspacemacs-remap-Y-to-y$ t
   ;; Location where to auto-save files. Possible values are `original' to
   ;; auto-save the file in-place, `cache' to auto-save the file to another
   ;; file stored in the cache directory and `nil' to disable auto-saving.
   ;; (default 'cache)
   dotspacemacs-auto-save-file-location 'cache
   ;; If non nil then `ido' replaces `helm' for some commands. For now only
   ;; `find-files' (SPC f f), `find-spacemacs-file' (SPC f e s), and
   ;; `find-contrib-file' (SPC f e c) are replaced. (default nil)
   dotspacemacs-use-ido nil
   ;; If non nil, `helm' will try to miminimize the space it uses. (default nil)
   dotspacemacs-helm-resize nil
   ;; if non nil, the helm header is hidden when there is only one source.
   ;; (default nil)
   dotspacemacs-helm-no-header nil
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
   ;; If non-nil smartparens-strict-mode will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode nil
   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'all
   ;; If non nil advises quit functions to keep server open when quitting.
   ;; (default nil)
   dotspacemacs-persistent-server t
   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `ag', `pt', `ack' and `grep'.
   ;; (default '("ag" "pt" "ack" "grep"))
   dotspacemacs-search-tools '("ag" "pt" "ack" "grep")
   ;; The default package repository used if no explicit repository has been
   ;; specified with an installed package.
   ;; Not used for now. (default nil)
   dotspacemacs-default-package-repository nil
   ))

(defun dotspacemacs/user-init ()
  "Initialization function for user code.
It is called immediately after `dotspacemacs/init'.  You are free to put any
user code."
  ; (setq waktime-python-bin "/usr/bin/python")

  ; Make sure emacs finds agda and ghc-mode etc.
  (add-to-list 'exec-path "~/.cabal/bin/")

  (setq-default
   vc-follow-symlinks t
   fci-rule-column 80
   global-evil-search-highlight-persist nil
   ;; evil-toggle-key "C-M-z"
   wakatime-api-key "***REMOVED***"
   wakatime-cli-path "/usr/local/bin/wakatime"
   waktime-python-bin "/usr/bin/python"
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

  (spacemacs/declare-prefix-for-mode 'haskell-mode "mm" "haskell/ghc-mod")
  (spacemacs/declare-prefix-for-mode 'haskell-mode "mm" "haskell/ghc-mod")
  (evil-leader/set-key-for-mode 'haskell-mode
    "mmt" 'ghc-insert-template-or-signature
    "mmu" 'ghc-initial-code-from-signature
    "mma" 'ghc-auto
    "mmf" 'ghc-refine
    "mme" 'ghc-expand-th
    "mmn" 'ghc-goto-next-hole
    "mmp" 'ghc-goto-prev-hole
    "mm>"  'ghc-make-indent-deeper
    "mm<"  'ghc-make-indent-shallower)

  ;; ============================================================
  (setq neo-theme 'ascii)
  (setq neo-show-updir-line t)
  ;; (evil-leader/set-key "tb" 'speedbar)

  (global-linum-mode 1)
  (setq linum-format 'dynamic)
  (global-subword-mode 1) ;; camelCaseWords
  (setq
   global-evil-search-highlight-persist nil
  )
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

  ;; clojure
  (eval-after-load 'flycheck
    '(setq flycheck-display-errors-function #'flycheck-pos-tip-error-messages))
  (eval-after-load 'flycheck '(flycheck-clojure-setup))
  (add-hook 'clojure-mode-hook #'flycheck-mode)
  ;; (add-hook 'clojure-mode-hook #'subword-mode)

  ;; agda
  ;; (setq agda2-include-dirs '("." "./stdlib/src"))

)

;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(magit-diff-use-overlays nil)
 '(ring-bell-function (quote ignore) t)
 )
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(company-tooltip-common ((t (:inherit company-tooltip :weight bold :underline nil))))
 '(company-tooltip-common-selection ((t (:inherit company-tooltip-selection :weight bold :underline nil)))))
