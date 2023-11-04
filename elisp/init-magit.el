;;; init-magit.el --- Magit configuration  -*- lexical-binding: t; -*-

;;; Commentary:
;;
;; TODO: rework magit and magit-todos require logic, maybe with
;;       emacs-startup-hook

;;; Code:
(with-eval-after-load 'init-package
  (unless (package-installed-p 'magit)
    (package-install 'magit))

  (require 'magit)

  (with-eval-after-load 'git-commit
    (define-derived-mode cnr/git-commit-mode text-mode "Commit"
      "Major mode for editing Git commit messages.
Intended to be used as `git-commit-major-mode', thus simplifying
configuration and customization.")

    (customize-set-variable 'git-commit-major-mode #'cnr/git-commit-mode)

    (add-hook 'git-commit-setup-hook #'git-commit-turn-on-auto-fill)
    (add-hook 'git-commit-setup-hook #'git-commit-turn-on-flyspell)
    (add-hook 'git-commit-setup-hook
              (progn
                (defun cnr/fill-column-72 nil (setq fill-column 72))
                #'cnr/fill-column-72))))


;; magit-todos
(with-eval-after-load 'init-package
  (unless (package-installed-p 'magit-todos)
    (package-vc-install (github "alphapapa/magit-todos")))

  (with-eval-after-load 'magit
    (require 'magit-todos)
    (magit-todos-mode 1)))


(provide 'init-magit)
;;; init-magit.el ends here
