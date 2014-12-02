(defvar auctex-pre-extensions
  '(
    ;; pre extension auctexs go here
    )
  "List of all extensions to load before the packages.")

(defvar auctex-post-extensions
  '(
    ;; post extension auctexs go here
    )
  "List of all extensions to load after the packages.")

;; For each extension, define a function auctex/init-<extension-auctex>
;;
;; (defun auctex/init-my-extension ()
;;   "Initialize my extension"
;;   )
;;
;; Often the body of an initialize function uses `use-package'
;; For more info on `use-package', see readme:
;; https://github.com/jwiegley/use-package
