;; -*- mode: dotspacemacs -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Configuration Layers declaration."
  (setq-default
   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (ie. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '()
   ;; List of configuration layers to load. If it is the symbol `all' instead
   ;; of a list then all discovered layers will be installed.
   dotspacemacs-configuration-layers '( rainbow-mode
                                        highlight-indentation
                                        filetypes python git
                                        themes-megapack
                                        markdown
                                        finance

                                        ; org-mode
                                        ;winpoint
                                        ;nlinum
                                        ;paradox
                                        ;ess
                                        haskell
                                        ;myauctex
                                        auctex
                                       )
   ;; A list of packages and/or extensions that will not be install and loaded.
   dotspacemacs-excluded-packages '()
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
   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to a .PNG file.
   ;; If the value is nil then no banner is displayed.
   ;; dotspacemacs-startup-banner 'official
   dotspacemacs-startup-banner 'official
   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press <SPC> T n to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '( monokai
                         solarized-light
                         solarized-dark
                         leuven
                         zenburn)
   ;; If non nil the cursor color matches the state color.
   dotspacemacs-colorize-cursor-according-to-state t
   ;; Default font. `powerline-scale' allows to quickly tweak the mode-line
   ;; size to make separators look not too crappy.
   dotspacemacs-default-font '("Source Code Pro"
                               :size 13
                               :weight normal
                               :width normal
                               :powerline-scale 1.1)
   ;; The leader key
   dotspacemacs-leader-key "SPC"
   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it.
   dotspacemacs-major-mode-leader-key ","
   ;; The command key used for Evil commands (ex-commands) and
   ;; Emacs commands (M-x).
   ;; By default the command key is `:' so ex-commands are executed like in Vim
   ;; with `:' and Emacs commands are executed with `<leader> :'.
   dotspacemacs-command-key ":"
   ;; If non nil the paste micro-state is enabled. While enabled pressing `p`
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
   dotspacemacs-smartparens-strict-mode nil
   ;; If non nil advises quit functions to keep server open when quitting.
   dotspacemacs-persistent-server t
   ;; The default package repository used if no explicit repository has been
   ;; specified with an installed package.
   ;; Not used for now.
   dotspacemacs-default-package-repository nil

   dotspacemacs-editing-style 'vim
   dotspacemacs-verbose-loading t
   ;dotspacemacs-startup-lists 'recents
   )
  ;; User initialization goes here
  (setq-default
   vc-follow-symlinks t
   fci-rule-column 80
   global-evil-search-highlight-persist nil
   ))

(defun dotspacemacs/config ()
  "Configuration function.
 This function is called at the very end of Spacemacs initialization after
layers configuration."

   (define-key evil-insert-state-map "\C-e" 'end-of-line)
   (evil-define-key 'visual evil-surround-mode-map "s" 'evil-substitute)
   (evil-define-key 'visual evil-surround-mode-map "S" 'evil-surround-region)
   (global-linum-mode t)
   (smartparens-global-mode 1)
   (define-globalized-minor-mode global-fci-mode fci-mode (lambda () (fci-mode 1)))
   ;(define-globalized-minor-mode global-highlight-indentation-mode highlight-indentation-mode (lambda () (highlight-indentation-mode 1)))
   ;(global-highlight-indentation-mode 1)
   (global-fci-mode 1)
   (electric-pair-mode 0)
   (evil-leader/set-key
   ;     ;; "ef" 'find-file ; Already implemented with SPC f f 
        "te" 'electric-pair-mode
   ;     "thi" 'indent-guide-global-mode
   ;     "thh" 'global-highlight-indentation-mode
    ;    "thp" 'global-fci-mode
        "bb" 'ad-Orig-switch-to-buffer 
        "bl" 'switch-to-next-buffer
        "bh" 'switch-to-prev-buffer
        "bd" 'kill-buffer-ask
        "bn" 'new-empty-buffer)
  ; (progn
  ;   (setq
    
  ;   ;(indent-guide-global-mode 1)
  ;   ;; Fix override of the substitute key. This is already fixed upstream.

  ;   ;; Why would I want to scroll?
    
  ;   (put 'if 'lisp-indent-function nil)
  ;   (put 'when 'lisp-indent-function 1)
  ;   (put 'unless 'lisp-indent-function 1)
  ;   )
    (setq ispell-dictionary "is")
    (setq-default
     LaTeX-command "latex -shell-escape"
     Tex-PDF-mode t)
    
    ;; (add-hook 'haskell-mode-hook
    ;;           (lambda ()
    ;;              (electric-indent-mode 0)))
    ;; (evil-define-key 'insert haskell-indentation-mode-map
    ;;   (kbd "RET") nil
    ;;   (kbd "RET") 'haskell-indentation-newline-and-indent
    ;;   )
)

;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(LaTeX-command "latex -shell-escape")
 '(ac-ispell-requires 4)
 '(ahs-case-fold-search nil)
 '(ahs-default-range (quote ahs-range-whole-buffer))
 '(ahs-idle-interval 0.25)
 '(ahs-idle-timer 0 t)
 '(ahs-inhibit-face-list nil)
 '(hy-indent-specform (quote (("for" . 1) ("for*" . 1) ("while" . 1) ("except" . 1) ("catch" . 1) ("let" . 1) ("when" . 1) ("unless" . 1))))
 '(linum-format (quote dynamic))
 '(linum-relative-format "%3s")
 '(paradox-github-token t)
 '(ring-bell-function (quote ignore) t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:background nil))))
 '(variable-pitch ((t (:family "default")))))


