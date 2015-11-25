;; -*- mode: emacs-lisp -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

;; Spacemacs v.0.103.2

(defun dotspacemacs/layers ()

  "Configuration Layers declaration."
  (setq-default
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
                      auto-completion-enable-snippets-in-popup t
                      )
        ;; themes-megapack
        syntax-checking
        spell-checking
        (colors :variables colors-enable-rainbow-identifiers t)

        ;; Fun
        games

        ;; ----------------------------------------------------------------
        ;; Tools
        ;; ----------------------------------------------------------------
        ;; wakatime
        (ranger :variables ranger-show-preview t)
        ;; (shell :variables shell-default-shell 'multi-term)

        ;; ----------------------------------------------------------------
        ;; Languages
        ;; ----------------------------------------------------------------
        markdown
        yaml
        emacs-lisp
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
        agda
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
        ; ibuffer
        ; spotify
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
   ;; the list `dotspacemacs-configuration-layers'
   dotspacemacs-delete-orphan-packages t))

(defun dotspacemacs/init ()
  "Initialization function.
This function is called at the very startup of Spacemacs initialization
before layers configuration."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; Either `vim' or `emacs'. Evil is always enabled but if the variable
   ;; is `emacs' then the `holy-mode' is enabled at startup.
   ;; New in 104: Hybrid allows emacs keybindings in insert mode.
   dotspacemacs-editing-style 'hybrid
   ;; If non nil output loading progress in `*Messages*' buffer.
   dotspacemacs-verbose-loading nil
   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed.
   dotspacemacs-startup-banner 'official
   ;; List of items to show in the startup buffer. If nil it is disabled.
   ;; Possible values are: `recents' `bookmarks' `projects'."
   dotspacemacs-startup-lists '(recents projects)
   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press <SPC> T n to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(
                         monokai
                         leuven
                         zenburn
                         gotham
                         spacemacs-dark
                         spacemacs-light
                         )
   ;; If non nil the cursor color matches the state color.
   dotspacemacs-colorize-cursor-according-to-state t
   ;; Default font. `powerline-scale' allows to quickly tweak the mode-line
   ;; size to make separators look not too crappy.
   dotspacemacs-default-font '("Hack"
                               :size 12
                               :weight normal
                               :width normal
                               ;:powerline-scale 1.1)
                               :powerline-scale 1.0)
   ;; The leader key
   dotspacemacs-leader-key "SPC"
   ;; The leader key accessible in `emacs state' and `insert state'
   dotspacemacs-emacs-leader-key "M-m"
   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it.
   dotspacemacs-major-mode-leader-key ","
   ;; Major mode leader key accessible in `emacs state' and `insert state'
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"
   ;; The command key used for Evil commands (ex-commands) and
   ;; Emacs commands (M-x).
   ;; By default the command key is `:' so ex-commands are executed like in Vim
   ;; with `:' and Emacs commands are executed with `<leader> :'.
   dotspacemacs-command-key ":"
   ;; Location where to auto-save files. Possible values are `original' to
   ;; auto-save the file in-place, `cache' to auto-save the file to another
   ;; file stored in the cache directory and `nil' to disable auto-saving.
   ;; Default value is `cache'.
   dotspacemacs-auto-save-file-location 'cache
   ;; If non nil then `ido' replaces `helm' for some commands. For now only
   ;; `find-files' (SPC f f) is replaced.
   dotspacemacs-use-ido nil
   ;; If non nil the paste micro-state is enabled. When enabled pressing `p`
   ;; several times cycle between the kill ring content.
   dotspacemacs-enable-paste-micro-state t
   ;; Guide-key delay in seconds. The Guide-key is the popup buffer listing
   ;; the commands bound to the current keystrokes.
   dotspacemacs-guide-key-delay 0.4
   ;; If non nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil ;; to boost the loading time.
   dotspacemacs-loading-progress-bar t
   ;; If non nil the frame is fullscreen when Emacs starts up.
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup nil
   ;; If non nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX."
   dotspacemacs-fullscreen-use-non-native nil
   ;; If non nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup nil
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'.
   dotspacemacs-active-transparency 90
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'.
   dotspacemacs-inactive-transparency 90
   ;; If non nil unicode symbols are displayed in the mode line.
   dotspacemacs-mode-line-unicode-symbols t
   ;; If non nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters the
   ;; point when it reaches the top or bottom of the screen.
   dotspacemacs-smooth-scrolling t
   ;; If non-nil smartparens-strict-mode will be enabled in programming modes.
   dotspacemacs-smartparens-strict-mode t
   ;; Select a scope to highlight delimiters. Possible value is `all',
   ;; `current' or `nil'. Default is `all'
   dotspacemacs-highlight-delimiters 'all
   ;; If non nil advises quit functions to keep server open when quitting.
   dotspacemacs-persistent-server t
   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `ag', `pt', `ack' and `grep'.
   dotspacemacs-search-tools '("ag" "pt" "ack" "grep")
   ;; The default package repository used if no explicit repository has been
   ;; specified with an installed package.
   ;; Not used for now.
   dotspacemacs-default-package-repository nil
   )
  ;; User initialization goes here
  ; (setq waktime-python-bin "/usr/bin/python")

  ; Make sure emacs finds agda and ghc-mode etc.
  (add-to-list 'exec-path "~/.cabal/bin/")

  (setq-default
   vc-follow-symlinks t
   fci-rule-column 80
   global-evil-search-highlight-persist nil
   )
 )

(defun dotspacemacs/config ()
  "Configuration function.
 This function is called at the very end of Spacemacs initialization after
layers configuration."
  ; (define-key evil-insert-state-map "\C-e" 'end-of-line)
  (evil-define-key 'visual evil-surround-mode-map "s" 'evil-substitute)
  (evil-define-key 'visual evil-surround-mode-map "S" 'evil-surround-region)

  ;;================ Haskell ==========================
  ;; Use the stack ghc-mod file.
  (add-to-list 'load-path "~/.stack/global-project/.stack-work/install/x86_64-linux/lts-3.12/7.10.2/share/x86_64-linux-ghc-7.10.2/ghc-mod-5.4.0.0/elisp/")
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
  (evil-leader/set-key "tb" 'speedbar)
  (global-linum-mode 1)
  (global-subword-mode 1) ;; camelCaseWords
  ; (setq ispell-dictionary "is")
  ;; (setq-default
  ;;  LaTeX-command "latex -shell-escape"
  ;;  Tex-PDF-mode t)
  ; Better for terminus
  (setq powerline-default-separator 'arrow-fade)
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
  (setq agda2-include-dirs '("." "./stdlib/src"))
)

;; Do not write anything past this comme
;; auto-generate custom variable definitions.
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(compilation-message-face (quote default))
 '(cua-global-mark-cursor-color "#2aa198")
 '(cua-normal-cursor-color "#657b83")
 '(cua-overwrite-cursor-color "#b58900")
 '(cua-read-only-cursor-color "#859900")
 '(evil-toggle-key "C-M-z")
 '(highlight-changes-colors (quote ("#d33682" "#6c71c4")))
 '(highlight-symbol-colors
   (--map
    (solarized-color-blend it "#fdf6e3" 0.25)
    (quote
     ("#b58900" "#2aa198" "#dc322f" "#6c71c4" "#859900" "#cb4b16" "#268bd2"))))
 '(highlight-symbol-foreground-color "#586e75")
 '(highlight-tail-colors
   (quote
    (("#eee8d5" . 0)
     ("#B4C342" . 20)
     ("#69CABF" . 30)
     ("#69B7F0" . 50)
     ("#DEB542" . 60)
     ("#F2804F" . 70)
     ("#F771AC" . 85)
     ("#eee8d5" . 100))))
 '(hl-bg-colors
   (quote
    ("#DEB542" "#F2804F" "#FF6E64" "#F771AC" "#9EA0E5" "#69B7F0" "#69CABF" "#B4C342")))
 '(hl-fg-colors
   (quote
    ("#fdf6e3" "#fdf6e3" "#fdf6e3" "#fdf6e3" "#fdf6e3" "#fdf6e3" "#fdf6e3" "#fdf6e3")))
 '(magit-diff-use-overlays nil)
 '(pos-tip-background-color "#eee8d5")
 '(pos-tip-foreground-color "#586e75")
 '(powerline-default-separator (quote arrow-fade))
 '(ring-bell-function (quote ignore) t)
 '(smartrep-mode-line-active-bg (solarized-color-blend "#859900" "#eee8d5" 0.2))
 '(term-default-bg-color "#fdf6e3")
 '(term-default-fg-color "#657b83")
 '(wakatime-api-key "***REMOVED***")
 '(wakatime-cli-path "/usr/local/bin/wakatime")
 '(waktime-python-bin "/usr/bin/python")
 '(weechat-color-list
   (quote
    (unspecified "#fdf6e3" "#eee8d5" "#990A1B" "#dc322f" "#546E00" "#859900" "#7B6000" "#b58900" "#00629D" "#268bd2" "#93115C" "#d33682" "#00736F" "#2aa198" "#657b83" "#839496"))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((((class color) (min-colors 257)) (:foreground "#F8F8F2" :background "#272822")) (((class color) (min-colors 89)) (:foreground "#F5F5F5" :background "#1B1E1C"))))
 '(company-tooltip-common ((t (:inherit company-tooltip :weight bold :underline nil))))
 '(company-tooltip-common-selection ((t (:inherit company-tooltip-selection :weight bold :underline nil)))))
