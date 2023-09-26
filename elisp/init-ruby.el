;;; init-ruby.el --- Ruby configuration  -*- lexical-binding: t; -*-

;;; Commentary:
;;

;;; Code:
(with-eval-after-load 'init-package
  (unless (package-installed-p 'inf-ruby)
    (package-install 'inf-ruby))
  (unless (package-installed-p 'yari)
    (package-vc-install (github "hron/yari.el"))))


(with-eval-after-load 'ruby-mode
  (add-hook 'ruby-mode-hook #'inf-ruby-minor-mode)
  (define-key ruby-mode-map (kbd "C-c ?") #'yari)

  (with-eval-after-load 'compile
    (add-to-list 'compilation-error-regexp-alist-alist
                 '(rails-minitest-failure "\\[\\(.*?.rb\\):\\([0-9]+\\)\\]:$" 1 2))
    (add-to-list 'compilation-error-regexp-alist 'rails-minitest-failure)))


(provide 'init-ruby)
;;; init-ruby.el ends here
