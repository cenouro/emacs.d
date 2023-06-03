;;; init-prog.el --- Generic programming configurations  -*- lexical-binding: t; -*-

;;; Commentary:
;;
;; TODO: move yaml-mode and markdown-mode here?


;;; Code:
(require 'package)

(unless (package-installed-p 'hl-todo)
  (package-install 'hl-todo))


(add-hook 'prog-mode-hook #'flyspell-prog-mode)


(require 'hl-todo)
(global-hl-todo-mode)


(provide 'init-prog)

;;; init-prog.el ends here
