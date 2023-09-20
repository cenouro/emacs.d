;;; init-ruby.el --- Ruby configuration  -*- lexical-binding: t; -*-

;;; Commentary:
;;

;;; Code:
(with-eval-after-load 'package
  (dolist (pkg '(bundler inf-ruby yari))
    (unless (package-installed-p pkg)
      (package-install pkg))))


(with-eval-after-load 'ruby-mode
  (add-hook 'ruby-mode-hook #'inf-ruby-minor-mode)
  (define-key ruby-mode-map (kbd "C-c ?") #'yari)

  (with-eval-after-load 'compile
    (add-to-list 'compilation-error-regexp-alist-alist
                 '(rails-minitest-failure "\\[\\(.*?.rb\\):\\([0-9]+\\)\\]:$" 1 2))
    (add-to-list 'compilation-error-regexp-alist 'rails-minitest-failure)))


(provide 'init-ruby)
;;; init-ruby.el ends here
