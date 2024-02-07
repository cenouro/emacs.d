;;; init-undo-tree.el ---  -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:
(require 'init-package)
(unless (package-installed-p 'undo-tree)
  (package-install 'undo-tree))
(require 'undo-tree)

(global-undo-tree-mode)

(provide 'init-undo-tree)
;;; init-undo-tree.el ends here
