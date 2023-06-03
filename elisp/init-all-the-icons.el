;;; init-all-the-icons.el --- all-the-icons configuration  -*- lexical-binding: t; -*-

;;; Commentary:
;;

;;; Code:
(require 'package)
(unless (package-installed-p 'all-the-icons)
  (progn
    (package-install 'all-the-icons)
    (require 'all-the-icons)
    (all-the-icons-install-fonts t)))


(when (display-graphic-p)
  (require 'all-the-icons))

(provide 'init-all-the-icons)
;;; init-all-the-icons.el ends here
