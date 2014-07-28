(if (and (fboundp 'server-running-p) (not (server-running-p))) (server-start))
(require 'package)

(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)

(package-initialize)

(unless (fboundp 'evil-mode)
  (package-install 'evil))

(unless (fboundp 'evil-leader-mode)
  (package-install 'evil-leader))

(require 'evil)
(evil-mode 1)
(require 'evil-leader)
(global-evil-leader-mode)

(evil-leader/set-leader "<SPC>")
(evil-leader/set-key
    "e" 'find-file)

(scroll-bar-mode -1)
(tool-bar-mode -1)
(menu-bar-mode -1)
(global-linum-mode t)
(require 'auto-complete)

(global-auto-complete-mode t)
(require 'fill-column-indicator)
(add-hook 'after-change-major-mode-hook 'fci-mode)
(setq fci-rule-column 79)
(setq fci-rule-color "darkslategrey")

(setq inhibit-startup-screen t)
(setq initial-buffer-choice nil)
(setq initial-scratch-message nil)

(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")
(load-theme 'molokai t)



;(setq required-package-list '(
;                  auto-complete
;                  evil
;                  evil-leader
;                  fill-column-indicator
;                  js2-mode
;                  projectile
;                  auctex
;                  nlinum
;                  ))
;
;(unless package-archive-contents
;  (package-refresh-contents))
;
; install the missing packages
;(dolist (package required-package-list)
;  (unless (package-installed-p package)
;    (package-install package)))
;





(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(LaTeX-command "latex -shell-escape")
 '(TeX-PDF-mode t)
 '(custom-safe-themes (quote ("9fd20670758db15cc4d0b4442a74543888d2e445646b25f2755c65dcd6f1504b" "ce79400f46bd76bebeba655465f9eadf60c477bd671cbcd091fe871d58002a88" "e26780280b5248eb9b2d02a237d9941956fc94972443b0f7aeec12b5c15db9f3" "bf648fd77561aae6722f3d53965a9eb29b08658ed045207fe32ffed90433eb52" "90b5269aefee2c5f4029a6a039fb53803725af6f5c96036dee5dc029ff4dff60" default)))
 '(inhibit-startup-echo-area-message "tritlo")
 '(inhibit-startup-screen t)
 '(initial-buffer-choice nil)
 '(initial-scratch-message nil)
 '(linum-format "%4i")
 '(remote-shell-program "ssh"))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "#222222" :foreground "#BEBFB7" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 128 :width normal :foundry "unknown" :family "Terminus")))))

; Load el4r, which loads Xiki
;(add-to-list 'load-path "/var/lib/gems/1.9.1/gems/trogdoro-el4r-1.0.10/data/emacs/site-lisp/")
;(require 'el4r)
;(el4r-boot)
;(el4r-troubleshooting-keys)

; Don't create #... files when editing
(setq make-backup-files nil)
