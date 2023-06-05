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
  (package-install 'hl-todo))


(add-hook 'prog-mode-hook #'flyspell-prog-mode)


(require 'hl-todo)
(global-hl-todo-mode)


;; Languages/major modes
(dolist (major '(markdown-mode
                 yaml-mode))
  (progn
    (unless (package-installed-p major)
      (package-install major))
    (require major)))


(provide 'init-prog)
;;; init-prog.el ends here
