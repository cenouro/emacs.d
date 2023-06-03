;;; init-vdiff.el --- Vdiff configuration  -*- lexical-binding: t; -*-

;;; Commentary:
;;

;;; Code:
(require 'package)

(dolist (pkg '(vdiff vdiff-magit))
  (unless (package-installed-p pkg)
    (package-install pkg)))


(require 'vdiff)

(define-key vdiff-mode-map      (kbd "C-c") vdiff-mode-prefix-map)
(define-key vdiff-3way-mode-map (kbd "C-c") vdiff-mode-prefix-map)

(customize-set-variable 'vdiff-diff-algorithm 'git-diff-patience)


(with-eval-after-load 'magit
  (require 'vdiff-magit)
  (customize-set-variable 'vdiff-magit-stage-is-2way t)

  (define-key magit-mode-map "e" #'vdiff-magit-dwim)
  (define-key magit-mode-map "E" #'vdiff-magit)

  (transient-suffix-put #'magit-dispatch "e" :description "Vdiff (dwim)")
  (transient-suffix-put #'magit-dispatch "e" :command    #'vdiff-magit-dwim)
  (transient-suffix-put #'magit-dispatch "E" :description "Vdiff")
  (transient-suffix-put #'magit-dispatch "E" :command    #'vdiff-magit))


(provide 'init-vdiff)
;;; init-vdiff.el ends here
