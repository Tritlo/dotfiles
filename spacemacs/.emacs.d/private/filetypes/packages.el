(defvar filetypes-packages
  '(
    ;; package filetypess go here
    dockerfile-mode
    )
  "List of all packages to install and/or initialize. Built-in packages
which require an initialization must be listed explicitly in the list.")

(defvar filetypes-excluded-packages '()
  "List of packages to exclude.")

;; For each package, define a function filetypes/init-<package-filetypes>
;;
;; (defun filetypes/init-filetypes ()
;;   "Initialize my package"
;; )
;;
;; Often the body of an initialize function uses `use-package'
;; For more info on `use-package', see readme:
;; https://github.com/jwiegley/use-package
