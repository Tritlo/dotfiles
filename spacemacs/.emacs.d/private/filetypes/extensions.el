(defvar filetypes-pre-extensions
  '(
    ;; pre extension filetypess go here
    )
  "List of all extensions to load before the packages.")

(defvar filetypes-post-extensions
  '(
    ;; post extension filetypess go here
    )
  "List of all extensions to load after the packages.")

;; For each extension, define a function filetypes/init-<extension-filetypes>
;;
;; (defun filetypes/init-my-extension ()
;;   "Initialize my extension"
;;   )
;;
;; Often the body of an initialize function uses `use-package'
;; For more info on `use-package', see readme:
;; https://github.com/jwiegley/use-package
