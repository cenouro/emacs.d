;;; init-magit.el --- Magit configuration  -*- lexical-binding: t; -*-

;;; Commentary:
;;

;;; Code:
(require 'package)

(unless (package-installed-p 'magit)
  (package-install 'magit))
(unless (package-installed-p 'magit-todos)
  (package-vc-install (github "alphapapa/magit-todos")))


(require 'magit)

(add-hook 'git-commit-setup-hook #'(lambda ()
                                     (git-commit-turn-on-flyspell)
                                     (git-commit-turn-on-auto-fill)
                                     (customize-set-variable 'fill-column 72)))


(require 'magit-todos)
(magit-todos-mode 1)

(provide 'init-magit)
;;; init-magit.el ends here
