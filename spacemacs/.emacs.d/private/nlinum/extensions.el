(defvar nlinum-pre-extensions
  '(
    ;; pre extension nlinums go here
    )
  "List of all extensions to load before the packages.")

(defvar nlinum-post-extensions
  '(
    ;; post extension nlinums go here
    )
  "List of all extensions to load after the packages.")

;; For each extension, define a function nlinum/init-<extension-nlinum>
;;
;; (defun nlinum/init-my-extension ()
;;   "Initialize my extension"
;;   )
;;
;; Often the body of an initialize function uses `use-package'
;; For more info on `use-package', see readme:
;; https://github.com/jwiegley/use-package
