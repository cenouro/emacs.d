;;; init-package.el --- package.el configurations  -*- lexical-binding: t; -*-

;;; Commentary:

;; Besides initializing and configuring package.el, this file also
;; installs dash.el, s.el and f.el, which are common dependencies for
;; some other packages.

;; The main goal of this file is to be used with the
;; `with-eval-after-load':

;; Instead of
;;   (with-eval-after-load 'package ...)
;; Use
;;   (with-eval-after-load 'init-package ...)

;; This not only ensures that package.el has been required, but also
;; that the pertinent configurations have been applied.

;;; Code:

(defun github (repo)
  (concat "https://github.com/" repo))

(defun github-file (repo file)
  (concat (github repo) "/raw/master/" file))

(require 'package)
(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))


;;; Common dependencies for other packages:

(unless (package-installed-p 'dash)
  (package-install 'dash))

;; s.el and f.el are installed by dumping the relevant files somewhere
;; in the load path. This is done to avoid byte-compiler errors from
;; irrelevant files (such as test files).
(progn
  (make-directory (expand-file-name "github" package-user-dir) 'noerror)
  (add-to-list 'load-path (expand-file-name "github" package-user-dir))

  (unless (require 's nil 'noerror)
    (url-copy-file (github-file "magnars/s.el" "s.el")
                   (expand-file-name "github/s.el" package-user-dir)
                   'noclobber))
  (unless (require 'f nil 'noerror)
    (url-copy-file (github-file "rejeep/f.el" "f.el")
                   (expand-file-name "github/f.el" package-user-dir)
                   'noclobber))
  (unless (require 'f-shortdoc nil 'noerror)
    (url-copy-file (github-file "rejeep/f.el" "f-shortdoc.el")
                   (expand-file-name "github/f-shortdoc.el" package-user-dir)
                   'noclobber)))


(provide 'init-package)

;;; init-package.el ends here
