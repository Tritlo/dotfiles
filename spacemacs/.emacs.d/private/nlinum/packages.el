(defvar nlinum-packages
  '(
    ;; package nlinums go here
    nlinum
    )
  "List of all packages to install and/or initialize. Built-in packages
which require an initialization must be listed explicitly in the list.")

(defvar nlinum-excluded-packages '()
  "List of packages to exclude.")

;; For each package, define a function nlinum/init-<package-nlinum>
;;
(defun nlinum/init-nlinum ()
  (progn
    (setq global-nlinum-mode t)
    )
   )
;;
;; Often the body of an initialize function uses `use-package'
;; For more info on `use-package', see readme:
;; https://github.com/jwiegley/use-package
