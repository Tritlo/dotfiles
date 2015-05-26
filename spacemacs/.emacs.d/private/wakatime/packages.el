;;; packages.el --- wakatime Layer packages File for Spacemacs
;;
;; Copyright (c) 2012-2014 Sylvain Benner
;; Copyright (c) 2014-2015 Sylvain Benner & Contributors
;;
;; Author: Sylvain Benner <sylvain.benner@gmail.com>
;; URL: https://github.com/syl20bnr/spacemacs
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

(defvar wakatime-packages
  '(
    wakatime-mode
    )
  "List of all packages to install and/or initialize. Built-in packages
which require an initialization must be listed explicitly in the list.")


;; For each package, define a function wakatime/init-<package-wakatime>
;;
(defun wakatime/init-wakatime-mode ()
  (use-package wakatime-mode
               :init
               (progn
                    (global-wakatime-mode)
                 ))
  )
;;
;; Often the body of an initialize function uses `use-package'
;; For more info on `use-package', see readme:
;; https://github.com/jwiegley/use-package
