;;; init-graphviz.el ---  -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:
(require 'init-package)
(require 'init-prog)

(unless (package-installed-p 'graphviz-dot-mode)
  (package-vc-install "https://github.com/ppareit/graphviz-dot-mode"))
(require 'graphviz-dot-mode)

(provide 'init-graphviz)
;;; init-graphviz.el ends here
