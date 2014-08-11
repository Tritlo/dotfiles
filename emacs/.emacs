(if (and (fboundp 'server-running-p) (not (server-running-p))) (server-start))
(require 'package)

(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
;(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages"))

(package-initialize)

(unless (fboundp 'evil-mode)
  (package-install 'evil))

(unless (fboundp 'evil-leader-mode)
  (package-install 'evil-leader))

(require 'iso-transl)

(require 'evil)
(evil-mode 1)
(require 'evil-leader)
(global-evil-leader-mode)


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

(require 'org)
(setq org-log-done t)
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-agenda-files (list "~/org/heima.org" "~/org/trello.org" "~/org/want-to-do.org"
                             "~/Dropbox/Dagbok/Journal/"))
(setq org-archive-location "~/org/archive.org::")

(setq org-agenda-file-regexp "\\`[^.].*\\.org'\\|[0-9]+")

(setq browse-url-browser-function 'browse-url-generic
          browse-url-generic-program "chromium-new-window")




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
 '(initial-scratch-buffer nil)
 '(linum-format "%4i")
 '(remote-shell-program "ssh"))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "#222222" :foreground "#BEBFB7" :inverse
-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight norm
al :height 128 :width normal :foundry "unknown" :family "Terminus")))))


; Load el4r, which loads Xiki
;(add-to-list 'load-path "/var/lib/gems/1.9.1/gems/trogdoro-el4r-1.0.10/data/emacs/site-lisp/")
;(require 'el4r)
;(el4r-boot)
;(el4r-troubleshooting-keys)

; Don't create #... files when editing
(setq make-backup-files nil)

(unless (fboundp 'org-trello-mode)
  (package-install 'org-trello))
(require 'org-trello)

(calendar-set-date-style 'iso)

(setq diary-file "~/2014.md" )
(setq org-agenda-include-diary t)

(require 'org-journal)
(setq org-journal-dir "~/Dropbox/Dagbok/Journal/")
(setq org-journal-date-format "%Y-%m-%d")


(setq my-skippable-buffers '("*Messages*" "*scratch*" "*Help*"))

(defun my-change-buffer (change-buffer)
    "Call CHANGE-BUFFER until current buffer is not in `my-skippable-buffers'."
      (let ((initial (current-buffer)))
            (funcall change-buffer)
                (let ((first-change (current-buffer)))
                        (catch 'loop
                                       (while (member (buffer-name) my-skippable-buffers)
                                                        (funcall change-buffer)
                                                                  (when (eq (current-buffer) first-change)
                                                                                (switch-to-buffer initial)
                                                                                            (throw 'loop t)))))))

(defun my-next-buffer ()
    "`next-buffer' that skips `my-skippable-buffers'."
      (interactive)
        (my-change-buffer 'next-buffer))

(defun my-previous-buffer ()
    "`previous-buffer' that skips `my-skippable-buffers'."
      (interactive)
        (my-change-buffer 'previous-buffer))


(evil-leader/set-leader "<SPC>")
(evil-leader/set-key
    "e" 'find-file
    "bl" 'my-next-buffer
    "bh" 'my-previous-buffer
    "bd" 'kill-this-buffer)
