(defvar rainbow-mode-pre-extensions
  '(
    ;; pre extension rainbow-modes go here
    )
  "List of all extensions to load before the packages.")

(defvar rainbow-mode-post-extensions
  '(
    ;; post extension rainbow-modes go here
    )
  "List of all extensions to load after the packages.")

;; For each extension, define a function rainbow-mode/init-<extension-rainbow-mode>
;;
;; (defun rainbow-mode/init-my-extension ()
;;   "Initialize my extension"
;;   )
;;
;; Often the body of an initialize function uses `use-package'
;; For more info on `use-package', see readme:
;; https://github.com/jwiegley/use-package
