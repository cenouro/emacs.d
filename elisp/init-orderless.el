;;; init-orderless.el --- Orderless configuration  -*- lexical-binding: t; -*-

;;; Commentary:
;;

;;; Code:
(require 'package)
(unless (package-installed-p 'orderless)
  (package-install 'orderless))


(customize-set-variable 'completion-styles '(orderless basic)
                        "The `basic' style is specified as a fallback")

(customize-set-variable 'completion-category-overrides
                        '((file (styles partial-completion)))
                        "For file path and wildcard expansions")


(require 'orderless)

(provide 'init-orderless)
;;; init-orderless.el ends here
