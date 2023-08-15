;;; init-eglot.el --- Eglot configuration  -*- lexical-binding: t; -*-

;;; Commentary:
;;

;;; Code:
(require 'package)
(unless (package-installed-p 'eglot)
  (package-install 'eglot))

(require 'eglot)


;; Ruby (Solargraph)
(defun cnr/ruby/solargraph-yml-exists-p ()
  "Return t if .solargraph.yml exists in current project."
  (and (project-current)
       (file-exists-p (expand-file-name ".solargraph.yml"
                                        (project-root (project-current))))))

(defun cnr/ruby/eglot-solargraph ()
  "Start Eglot in projects that use Solargraph."
  (when (cnr/ruby/solargraph-yml-exists-p)
    (eglot-ensure)))

(with-eval-after-load 'ruby-mode
  (add-hook 'ruby-mode-hook #'cnr/ruby/eglot-solargraph))


(provide 'init-eglot)
;;; init-eglot.el ends here
