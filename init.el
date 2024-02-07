;;; init.el --- My modular init.el  -*- lexical-binding: t; -*-

;;; Commentary:
;;

;;; Code:
;; These must be run before everything
(add-to-list 'load-path (locate-user-emacs-file "elisp"))
(require 'init-custom)


(require 'init-package)

(require 'init-emacs)
(require 'init-diminish)
(require 'init-undo-tree)

(require 'init-ace-window)
(require 'init-all-the-icons)

;; (require 'init-corfu)
;; (require 'init-marginalia)
;; (require 'init-orderless)
;; (require 'init-vertico)

(require 'init-helm)

(require 'init-flymake)
(require 'init-eglot)
(require 'init-prog)
(require 'init-apache)
(require 'init-graphviz)
(require 'init-markdown)
(require 'init-yaml)
(require 'init-asdf)
(require 'init-ansible)
(require 'init-elisp)
(require 'init-git)
(require 'init-magit)
(require 'init-vdiff)
(require 'init-ruby)


(unless (package-installed-p 'modus-themes)
  (package-install 'modus-themes))
(require 'modus-themes)
(load-theme 'modus-operandi :no-confirm)

(unless (package-installed-p 'page-break-lines)
  (package-install 'page-break-lines))
(require 'page-break-lines)
(global-page-break-lines-mode)


(provide 'init)
;;; init.el ends here
