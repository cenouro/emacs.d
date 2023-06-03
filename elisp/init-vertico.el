;;; init-vertico.el --- Vertico configuration  -*- lexical-binding: t; -*-

;;; Commentary:
;;
;; Helm is starting to show its age: I had some problems with some
;; Magit commands and `unhighlight-regexp'. On top of that, I've not
;; configured Helm's UI yet.
;;
;; I still believe Vertico has yet to pass the test of time, but it
;; feels like the time to retire Helm has come.
;;
;; TODO: pin to elpa
;;

;;; Code:
(require 'package)
(unless (package-installed-p 'vertico)
  (package-install 'vertico))


(with-eval-after-load 'orderless
  (customize-set-variable 'completion-category-defaults nil))


(customize-set-variable 'vertico-cycle         t)
(customize-set-variable 'vertico-scroll-margin 3)


(require 'vertico)
(vertico-mode)


(define-key vertico-map (kbd "RET") #'vertico-exit-input)

(provide 'init-vertico)
;;; init-vertico.el ends here
