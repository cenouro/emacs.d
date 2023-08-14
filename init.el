;;; init.el --- My modular init.el  -*- lexical-binding: t; -*-

;;; Commentary:
;;

;;; Code:
(require 'package)

(customize-set-variable 'package-archives
                        '(("elpa" . "https://elpa.gnu.org/packages/")
                          ("melpa" . "https://melpa.org/packages/")
                          ("melpa-stable" .
                           "https://stable.melpa.org/packages/")))

(customize-set-variable 'package-pinned-packages
                        '((corfu . "elpa")
                          ;; (flycheck . "melpa-stable")
                          (vertico . "elpa"))
                        "Must be set before `package-refresh-contents'")
(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))


(add-to-list 'load-path (locate-user-emacs-file "elisp"))

(require 'init-emacs)
(require 'init-ace-window)
(require 'init-all-the-icons)

(require 'init-corfu)
(require 'init-marginalia)
(require 'init-orderless)
(require 'init-vertico)

;; (require 'init-flycheck)
;; (require 'init-lsp-mode)
;; (require 'init-projectile)

(require 'init-flymake)
(require 'init-eglot)
(require 'init-prog)
(require 'init-asdf)
(require 'init-ansible)
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


(customize-set-variable 'custom-file
                        (expand-file-name "custom.el" user-emacs-directory))
(load custom-file)

(provide 'init)
;;; init.el ends here
