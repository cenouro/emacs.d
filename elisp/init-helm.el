;;; init-helm.el ---  -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:
(require 'init-package)
(unless (package-installed-p 'helm)
  (package-install 'helm))
(require 'helm)

(customize-set-variable 'tab-always-indent 'complete
                        "Required for TAB completion")

(customize-set-variable 'helm-command-prefix-key nil)

(global-set-key (kbd "M-x") #'helm-M-x)
(global-set-key (kbd "C-x C-f") #'helm-find-files)

(helm-mode 1)

(provide 'init-helm)
;;; init-helm.el ends here
