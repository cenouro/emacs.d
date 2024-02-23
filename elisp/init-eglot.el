;;; init-eglot.el --- Eglot configuration  -*- lexical-binding: t; -*-

;;; Commentary:
;;

;;; Code:
(require 'package)
(unless (package-installed-p 'eglot)
  (package-install 'eglot))

(require 'eglot)

(provide 'init-eglot)
;;; init-eglot.el ends here
