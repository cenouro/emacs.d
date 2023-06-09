;;; init-corfu.el --- Corfu configuration  -*- lexical-binding: t; -*-

;;; Commentary:
;;

;;; Code:
(require 'package)
(unless (package-installed-p 'corfu)
  (package-install 'corfu))


(with-eval-after-load 'orderless
  (customize-set-variable 'completion-category-defaults nil))


(require 'corfu)
(global-corfu-mode)

(define-key corfu-map (kbd "RET")       nil)
(define-key corfu-map (kbd "C-j")       #'corfu-insert)
(define-key corfu-map (kbd "TAB")       #'corfu-next)
(define-key corfu-map (kbd "<tab>")     #'corfu-next)
(define-key corfu-map (kbd "S-TAB")     #'corfu-previous)
(define-key corfu-map (kbd "<backtab>") #'corfu-previous)
(define-key corfu-map (kbd "SPC")       #'corfu-insert-separator)


(customize-set-variable 'tab-always-indent 'complete
                        "Required for TAB completion")

(customize-set-variable 'corfu-cycle t)
(customize-set-variable 'corfu-preview-current nil)
(customize-set-variable 'corfu-quit-no-match nil)


(defun corfu-enable-in-minibuffer ()
  "Enable Corfu in `M-:' and `M-!' (via `minibuffer-setup-hook')."
  ;; check if `completion-at-point' is bound"
  (when (where-is-internal #'completion-at-point
                           (list (current-local-map)))
    (setq-local corfu-auto nil
                corfu-echo-delay nil
                corfu-popupinfo-delay nil)
    (corfu-mode 1)))

(add-hook 'minibuffer-setup-hook #'corfu-enable-in-minibuffer)

(provide 'init-corfu)
;;; init-corfu.el ends here
