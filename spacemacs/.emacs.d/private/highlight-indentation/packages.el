(defvar highlight-indentation-packages
  '(
    indent-guide
    highlight-indentation
    ;; package highlight-indentations go here
    )
  "List of all packages to install and/or initialize. Built-in packages
which require an initialization must be listed explicitly in the list.")

(defvar highlight-indentation-excluded-packages '()
  "List of packages to exclude.")

;; For each package, define a function highlight-indentation/init-<package-highlight-indentation>
;;
;; (defun highlight-indentation/init-my-package () )
;;
;; Often the body of an initialize function uses `use-package'
;; For more info on `use-package', see readme:
;; https://github.com/jwiegley/use-package
