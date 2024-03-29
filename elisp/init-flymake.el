;;; init-flymake.el --- Flymake settings  -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:
(require 'init-package)

(require 'flymake)
(define-key flymake-mode-map (kbd "C-c f p") #'flymake-goto-prev-error)
(define-key flymake-mode-map (kbd "C-c f n") #'flymake-goto-next-error)
(define-key flymake-mode-map (kbd "C-c f f") #'flymake-show-buffer-diagnostics)


(unless (package-installed-p 'flymake-languagetool)
  (package-vc-install (github "emacs-languagetool/flymake-languagetool")))
(require 'flymake-languagetool)
(customize-set-variable 'flymake-languagetool-server-jar
                        (concat "/opt/" (user-login-name)
                                "/LanguageTool/languagetool-server.jar"))

(with-eval-after-load 'init-magit
  (customize-set-variable
   'flymake-languagetool-ignore-faces-alist
   (add-to-list 'flymake-languagetool-ignore-faces-alist
                '(cnr/git-commit-mode font-lock-comment-face
                                      git-commit-comment-action
                                      git-commit-comment-branch-local
                                      git-commit-comment-branch-remote
                                      git-commit-comment-detached
                                      git-commit-comment-file
                                      git-commit-comment-heading))
   "Disable LanguageTool in Git commit comments.")

  (add-hook 'cnr/git-commit-mode-hook #'flymake-languagetool-load)
  (add-hook 'cnr/git-commit-mode-hook #'flymake-mode 90))

(provide 'init-flymake)
;;; init-flymake.el ends here
