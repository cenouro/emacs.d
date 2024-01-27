;;; init-prog.el --- Generic programming configurations  -*- lexical-binding: t; -*-

;;; Commentary:
;;
;; Configurations, packages and settings that are useful for more than
;; a single programming language.
;;
;; This file may also contain "major-mode-packages" for languages that
;; don't require much configuration and that Emacs doesn't support out
;; of the box, such as Yaml and Markdown.

;;; Code:
(require 'package)
(unless (package-installed-p 'hl-todo)
  (package-vc-install (github "tarsius/hl-todo")))


(add-hook 'prog-mode-hook #'flyspell-prog-mode)


(require 'hl-todo)
(global-hl-todo-mode)


;; Languages/major modes
(dolist (major '(apache-mode
                 markdown-mode
                 yaml-mode))
  (progn
    (unless (package-installed-p major)
      (package-install major))
    (require major)))

(unless (package-installed-p 'graphviz-dot-mode)
  (package-vc-install (github "ppareit/graphviz-dot-mode")))


(provide 'init-prog)
;;; init-prog.el ends here
