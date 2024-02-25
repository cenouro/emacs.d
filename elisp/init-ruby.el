;;; init-ruby.el --- Settings for Ruby and Rails  -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:
(require 'init-package)
(require 'ruby-mode)

(unless (package-installed-p 'inf-ruby)
  (package-install 'inf-ruby))
(add-hook 'ruby-mode-hook #'inf-ruby-minor-mode)

(unless (package-installed-p 'yari)
  (package-vc-install (github "hron/yari.el")))
(define-key ruby-mode-map (kbd "C-c ?") #'yari)

(add-to-list 'auto-mode-alist '("/\\.irbrc\\'" . ruby-mode))


(with-eval-after-load 'compile
  (add-to-list 'compilation-error-regexp-alist-alist
               '(rails-minitest-failure "\\[\\(.*?.rb\\):\\([0-9]+\\)\\]:$" 1 2))
  (add-to-list 'compilation-error-regexp-alist 'rails-minitest-failure))


(with-eval-after-load 'eglot
  (when (version<= emacs-version "30")
    (advice-add #'jsonrpc-connection-receive :before
                #'(lambda (connection message)
                    (cl--do-remf message :requestMethod))
                '((name . nuke-problematic-keywords))))
  (add-to-list 'eglot-server-programs
               '(ruby-mode . ("bundle" "exec"
                              "srb tc --lsp --disable-watchman"))))

(provide 'init-ruby)
;;; init-ruby.el ends here
