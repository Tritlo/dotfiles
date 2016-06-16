;; 1. place this in ~/.emacs.d/private/intero/packages.el

;; 2. add intero, syntax-checking and auto-completion to your
;; ~/.spacemacs layer configuration & remove the haskell layer
;; if you were using that before

;; 3. make sure you have stack installed http://haskellstack.org

;; 4. fire up emacs & open up a stack project's source files

(defconst intero-packages
  '(company
    flycheck
    haskell-mode
    hindent
    (intero :location (recipe
                       :repo "commercialhaskell/intero"
                       :fetcher github
                       :files ("elisp/intero.el")))))

(defun intero/init-hindent ()
  (use-package haskell-mode))

(defun intero/post-init-hindent ()
  (add-hook 'intero-mode-hook 'hindent-mode))

(defun intero/post-init-company ()
  (add-hook 'intero-mode-hook 'company-mode))

(defun intero/post-init-flycheck ()
  (spacemacs/add-flycheck-hook 'intero-mode-hook))

(defun intero/init-haskell-mode ()
  (use-package haskell-mode
    :defer t
    :init
    (progn
      (defun spacemacs//force-haskell-mode-loading ()
        "Force `haskell-mode' loading when visiting cabal file."
        (require 'haskell-mode))
      (add-hook 'haskell-cabal-mode-hook
                'spacemacs//force-haskell-mode-loading))))

(defun intero/post-init-haskell-mode ()
  (add-hook 'haskell-mode-hook 'intero-mode))

(defun intero/init-intero ()
  (use-package intero
    :defer t
    :config
    (progn
      (spacemacs/declare-prefix-for-mode 'haskell-mode "mc" "haskell/cabal")
      (spacemacs/declare-prefix-for-mode 'haskell-mode "mi" "haskell/intero")
      (spacemacs/declare-prefix-for-mode 'haskell-mode "mh" "haskell/documentation")
      (spacemacs/declare-prefix-for-mode 'haskell-mode "md" "haskell/debug")
      (spacemacs/set-leader-keys-for-major-mode 'haskell-mode
        "f"   'haskell-mode-stylish-buffer
        "ii" 'intero-info
        "it" 'intero-type-at
        "il" 'intero-repl-load
        "ig" 'intero-goto-definition
        "iT" 'intero-targets

        "ca"  'haskell-process-cabal
        "cb"  'haskell-process-cabal-build
        "cc"  'haskell-compile
        "cv"  'haskell-cabal-visit-file

        "hh"  'hoogle
        "hH"  'haskell-hoogle-lookup-from-local
        "hi"  'intero-info
        "ht"  'intero-type-at

        "dl"  'flycheck-list-errors
        "dn"  'flycheck-next-error
        "dN"  'flycheck-previous-error))))
