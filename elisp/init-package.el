;;; init-package.el --- package.el configurations  -*- lexical-binding: t; -*-

;;; Commentary:

;; Besides initializing and configuring package.el, this file also
;; installs s.el and f.el, which are common dependencies for some
;; other packages.

;; The main goal of this file is to be used with the
;; `with-eval-after-load':

;; Instead of
;;   (with-eval-after-load 'package ...)
;; Use
;;   (with-eval-after-load 'init-package ...)

;; This not only ensures that package.el has been required, but also
;; that the pertinent configurations have been applied.

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

(provide 'init-package)

;;; init-package.el ends here
