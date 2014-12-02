(defvar Mine-packages
  '(
    ;; package Mines go here
    )
  "List of all packages to install and/or initialize. Built-in packages
which require an initialization must be listed explicitly in the list.")

(defvar Mine-excluded-packages '()
  "List of packages to exclude.")

;; For each package, define a function Mine/init-<package-Mine>
;;
;; (defun Mine/init-my-package ()
;;   "Initialize my package"
;;   )
;;
;; Often the body of an initialize function uses `use-package'
;; For more info on `use-package', see readme:
;; https://github.com/jwiegley/use-package
