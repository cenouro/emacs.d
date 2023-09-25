;;; init.el --- My modular init.el  -*- lexical-binding: t; -*-

;;; Commentary:
;;

;;; Code:
(require 'package)
(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))

;; Common dependencies for other packages
(unless (package-installed-p 's)
  (package-vc-install "https://github.com/magnars/s.el"))
(unless (package-installed-p 'f)
  (package-vc-install "https://github.com/rejeep/f.el"))


(add-to-list 'load-path (locate-user-emacs-file "elisp"))

(require 'init-emacs)
(require 'init-ace-window)
(require 'init-all-the-icons)

(require 'init-corfu)
(require 'init-marginalia)
(require 'init-orderless)
(require 'init-vertico)

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
