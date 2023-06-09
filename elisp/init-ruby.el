;;; init-ruby.el --- Ruby configuration  -*- lexical-binding: t; -*-

;;; Commentary:
;;

;;; Code:
(require 'package)

(dolist (pkg '(bundler inf-ruby yari))
  (unless (package-installed-p pkg)
    (package-install pkg)))


(with-eval-after-load 'inf-ruby
  (require 'bundler))


(require 'inf-ruby)
(add-hook 'ruby-mode-hook #'inf-ruby-minor-mode)


(require 'yari)
(with-eval-after-load 'ruby-mode
  (define-key ruby-mode-map (kbd "C-c ?") #'yari))


(provide 'init-ruby)
;;; init-ruby.el ends here
