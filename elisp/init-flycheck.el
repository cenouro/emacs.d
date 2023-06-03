;;; init-flycheck.el --- Flycheck configuration  -*- lexical-binding: t; -*-

;;; Commentary:
;;
;; TODO: pin package to melpa-stable

;;; Code:
(require 'package)
(unless (package-installed-p 'flycheck)
  (package-install 'flycheck))


(customize-set-variable 'flycheck-emacs-lisp-load-path 'inherit)

(add-to-list 'display-buffer-alist
             `(,(rx bos "*Flycheck errors*" eos)
               (display-buffer-reuse-window
                display-buffer-in-side-window)
               (side            . bottom)
               (reusable-frames . visible)
               (window-height   . 0.2)))


(require 'flycheck)
(global-flycheck-mode 1)

(defun cnr/flycheck-list-errors ()
  "Run `flycheck-list-errors' and select its buffer."
  (interactive)
  (flycheck-list-errors)
  (pop-to-buffer "*Flycheck errors*"))

(global-set-key (kbd "C-c l l") #'cnr/flycheck-list-errors)


(provide 'init-flycheck)
;;; init-flycheck.el ends here
