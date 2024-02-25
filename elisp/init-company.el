;;; init-company.el ---  -*- lexical-binding: t; -*-

;;; Commentary:
;;

;;; Code:
(require 'init-package)
(unless (package-installed-p 'company)
  (package-install 'company))
(require 'company)

(global-set-key (kbd "C-i") #'company-indent-or-complete-common)

(customize-set-variable 'company-format-margin-function #'company-text-icons-margin)
(customize-set-variable 'company-search-regexp-function #'company-search-words-in-any-order-regexp)

(add-hook 'after-init-hook #'global-company-mode)

(provide 'init-company)
;;; init-company.el ends here
