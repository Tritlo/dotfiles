(defvar highlight-indentation-pre-extensions
  '(
    ;; pre extension highlight-indentations go here
    )
  "List of all extensions to load before the packages.")

(defvar highlight-indentation-post-extensions
  '(
    ;; post extension highlight-indentations go here
    )
  "List of all extensions to load after the packages.")

;; For each extension, define a function highlight-indentation/init-<extension-highlight-indentation>
;;
;; (defun highlight-indentation/init-my-extension ()
;;   "Initialize my extension"
;;   )
;;
;; Often the body of an initialize function uses `use-package'
;; For more info on `use-package', see readme:
;; https://github.com/jwiegley/use-package
