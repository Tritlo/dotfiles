(defvar auctex-packages
  '(
    ;; package auctexs go here
    auctex
    )
  "List of all packages to install and/or initialize. Built-in packages
which require an initialization must be listed explicitly in the list.")

(defvar auctex-excluded-packages '()
  "List of packages to exclude.")

(defun auctex/init-auctex ()
  (use-package tex
      :ensure auctex
      :init
      (progn
        (setq-default LaTeX-command "latex -shell-escape")
        (setq-default Tex-PDF-mode t)
        )
      )
   )
;; For each package, define a function auctex/init-<package-auctex>
;;
;; (defun auctex/init-my-package ()
;;   "Initialize my package"
;;   )
;;
;; Often the body of an initialize function uses `use-package'
;; For more info on `use-package', see readme:
;; https://github.com/jwiegley/use-package
