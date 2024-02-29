;;; init-company.el ---  -*- lexical-binding: t; -*-

;;; Commentary:
;;

;;; Code:
(require 'init-package)
(unless (package-installed-p 'company)
  (package-install 'company))
(require 'company)

(global-set-key (kbd "C-i") #'company-indent-or-complete-common)

(customize-set-variable 'company-dabbrev-code-ignore-case t)
(customize-set-variable 'company-format-margin-function #'company-text-icons-margin)
(customize-set-variable 'company-minimum-prefix-length 5)
(customize-set-variable 'company-search-regexp-function #'company-search-words-in-any-order-regexp)
(customize-set-variable 'company-tooltip-align-annotations t)
(customize-set-variable 'company-tooltip-annotation-padding 4)
(customize-set-variable 'company-tooltip-minimum-width 16)
(customize-set-variable 'company-tooltip-width-grow-only t)

(add-hook 'after-init-hook #'global-company-mode)

(provide 'init-company)
;;; init-company.el ends here
