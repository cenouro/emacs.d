;;; init-yaml.el ---  -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:
(require 'init-package)
(require 'init-prog)

(unless (package-installed-p 'yaml-mode)
  (package-install 'yaml-mode))
(require 'yaml-mode)

(provide 'init-yaml)
;;; init-yaml.el ends here
