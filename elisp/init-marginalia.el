;;; init-marginalia.el --- Marginalia configuration  -*- lexical-binding: t; -*-

;;; Commentary:
;;

;;; Code:
(require 'package)
(unless (package-installed-p 'marginalia)
  (package-install 'marginalia))


(require 'marginalia)
(marginalia-mode)


(define-key minibuffer-local-map (kbd "M-A") #'marginalia-cycle)


(provide 'init-marginalia)

;;; init-marginalia.el ends here
