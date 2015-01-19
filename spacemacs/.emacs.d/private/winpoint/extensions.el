(defvar winpoint-pre-extensions
  '(
    ;; pre extension winpoints go here
    )
  "List of all extensions to load before the packages.")

(defvar winpoint-post-extensions
  '(
    ;; post extension winpoints go here
    )
  "List of all extensions to load after the packages.")

;; For each extension, define a function winpoint/init-<extension-winpoint>
;;
;; (defun winpoint/init-my-extension ()
;;   "Initialize my extension"
;;   )
;;
;; Often the body of an initialize function uses `use-package'
;; For more info on `use-package', see readme:
;; https://github.com/jwiegley/use-package
