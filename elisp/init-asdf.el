;;; init-asdf.el --- asdf.el configuration


;;; Commentary:
;;
;; Installation is currently done through an Ansible role.
;;
;; TODO: install using package.el (maybe will be possible in emacs 29)
;;

;;; Code:
(add-to-list 'load-path (locate-user-emacs-file "asdf.el"))
(require 'asdf)
(asdf-enable)


(provide 'init-asdf)
;;; init-asdf.el ends here
