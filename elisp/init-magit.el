;;; init-magit.el --- Magit configuration  -*- lexical-binding: t; -*-

;;; Commentary:
;;
;; TODO: try to rely on autoloads instead of requiring magit and
;;       magit-todos

;; TODO: create a custom major mode and set `git-commit-major-mode'.
;;       this will simplify the configuration of some variables that
;;       are "major mode sensitive", such as
;;       `flymake-languagetool-ignore-faces-alist'.

;;; Code:
(with-eval-after-load 'init-package
  (unless (package-installed-p 'magit)
    (package-install 'magit))
  (unless (package-installed-p 'magit-todos)
    (package-vc-install (github "alphapapa/magit-todos"))))


(require 'magit)

(add-hook 'git-commit-setup-hook #'git-commit-turn-on-auto-fill)
(add-hook 'git-commit-setup-hook #'git-commit-turn-on-flyspell)
(add-hook 'git-commit-setup-hook
          (defun cnr/fill-column-72 () (setq fill-column 72)))


(require 'magit-todos)
(magit-todos-mode 1)

(provide 'init-magit)
;;; init-magit.el ends here
