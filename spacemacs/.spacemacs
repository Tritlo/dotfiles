;; -*- mode: emacs-lisp -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

;; Configuration Layers
;; --------------------

(setq-default
 ;; List of additional paths where to look for configuration layers.
 ;; Paths must have a trailing slash (ie. `~/.mycontribs/')
 dotspacemacs-configuration-layer-path '()
 ;; List of configuration layers to load.
 dotspacemacs-configuration-layers '(        rainbow-mode
                                             highlight-indentation
                                             filetypes python git
                                             themes-megapack
                                             org-mode
                                             ;winpoint
                                             ;nlinum
                                             ;paradox
                                             ;ess
                                             haskell
                                             myauctex
                                             ;auctex
                                             )
 ;; A list of packages and/or extensions that will not be install and loaded.
 dotspacemacs-excluded-packages '()
)

;; Settings
;; --------

(setq-default
 ;; Default theme applied at startup
 dotspacemacs-default-theme 'monokai
 ;; The leader key
 dotspacemacs-leader-key "SPC"
 ;; Major mode leader key is a shortcut key which is the equivalent of
 ;; pressing `<leader> m`
 dotspacemacs-major-mode-leader-key ","
 ;; The command key used for Evil commands (ex-commands) and
 ;; Emacs commands (M-x).
 ;; By default the command key is `:' so ex-commands are executed like in Vim
 ;; with `:' and Emacs commands are executed with `<leader> :'.
 dotspacemacs-command-key ":"
 ;; Guide-key delay in seconds. The Guide-key is the popup buffer listing
 ;; the commands bound to the current keystrokes.
 dotspacemacs-guide-key-delay 0.4
 ;; If non nil the frame is fullscreen when Emacs starts up (Emacs 24.4+ only).
 dotspacemacs-fullscreen-at-startup nil
 ;; If non nil the frame is maximized when Emacs starts up (Emacs 24.4+ only).
 ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
 dotspacemacs-maximized-at-startup nil
 ;; If non nil smooth scrolling (native-scrolling) is enabled. Smooth scrolling
 ;; overrides the default behavior of Emacs which recenters the point when
 ;; it reaches the top or bottom of the screen
 dotspacemacs-smooth-scrolling t
 ;; If non nil pressing 'jk' in insert state, ido or helm will activate the
 ;; evil leader.
 dotspacemacs-feature-toggle-leader-on-jk nil
 ;; If non-nil smartparens-strict-mode will be enabled in programming modes.
 dotspacemacs-smartparens-strict-mode nil
 ;; If non nil advises quit functions to keep server open when quitting.
 dotspacemacs-persistent-server t
 ;; The default package repository used if no explicit repository has been
 ;; specified with an installed package.
 ;; Not used for now.
 dotspacemacs-default-package-repository nil
 
 ;;electric-pair-mode t
 vc-follow-symlinks t
 fci-rule-column 80
 global-evil-search-highlight-persist nil
 
)

;; Initialization Hooks
;; --------------------

(defun dotspacemacs/init ()
  "User initialization for Spacemacs. This function is called at the very
 startup."
(setq-default 
  ; git-enable-github-support t
  git-magit-status-fullscreen t)
)

(defun dotspacemacs/config ()
  "This is were you can ultimately override default Spacemacs configuration.
This function is called at the very end of Spacemacs initialization."
  (progn
    (define-globalized-minor-mode global-fci-mode fci-mode (lambda () (fci-mode 1)))
    (define-globalized-minor-mode global-highlight-indentation-mode highlight-indentation-mode (lambda () (highlight-indentation-mode 1)))
    (global-fci-mode 1)
    (electric-pair-mode 0)
    (setq
     powerline-default-separator 'arrow
     indent-guide-recursive t)

    (global-linum-mode t)
    (indent-guide-global-mode 1)
    (smartparens-global-mode 1)
    (global-highlight-indentation-mode 1)
    ;; Fix override of the substitute key. This is already fixed upstream.
    (evil-define-key 'visual evil-surround-mode-map "s" 'evil-substitute)
    (evil-define-key 'visual evil-surround-mode-map "S" 'evil-surround-region)

    ;; Why would I want to scroll?
    (define-key evil-insert-state-map "\C-e" 'end-of-line)
    ; (define-key evil-normal-state-map "\C-e" 'end-of-line)
    ; (define-key evil-visual-state-map "\C-e" 'end-of-line)
    
    (put 'if 'lisp-indent-function nil)
    (put 'when 'lisp-indent-function 1)
    (put 'unless 'lisp-indent-function 1)
    (evil-leader/set-key
        ;; "ef" 'find-file ; Already implemented with SPC f f 
        "te" 'electric-pair-mode
        "thi" 'indent-guide-global-mode
        "thh" 'global-highlight-indentation-mode
        "thp" 'global-fci-mode
        "bb" 'ad-Orig-switch-to-buffer 
        "bl" 'switch-to-next-buffer
        "bh" 'switch-to-prev-buffer
        "bd" 'kill-buffer-ask
        "bn" 'new-empty-buffer)
    )
    (setq ispell-dictionary "is")

)


;; Custom variables
;; ----------------

;; Do not write anything in this section. This is where Emacs will
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


