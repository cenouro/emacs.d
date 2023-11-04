;;; init-flymake.el --- Flymake settings  -*- lexical-binding: t; -*-

;;; Commentary:

;; TODO: check whether (require 'flymake-languagetool) is really
;;       necessary or if we can rely on autoload.

;; TODO: check whether (require 'flymake) is really necessary or if we
;;       can rely on autoload.

;;; Code:
(require 'flymake)


;; flymake-languagetool
(unless (package-installed-p 'flymake-languagetool)
  (package-vc-install (github "emacs-languagetool/flymake-languagetool")))
(require 'flymake-languagetool)

(customize-set-variable 'flymake-languagetool-server-jar
                        (concat "/opt/" (user-login-name)
                                "/LanguageTool/languagetool-server.jar"))

(with-eval-after-load 'init-magit
  (add-hook 'cnr/git-commit-mode-hook #'flymake-languagetool-load)
  (add-hook 'cnr/git-commit-mode-hook #'flymake-mode 90))

(defun cnr/git-commit/disable-languagetool-in-comments ()
  (interactive)
  (make-local-variable 'flymake-languagetool-ignore-faces-alist)
  (customize-set-value 'flymake-languagetool-ignore-faces-alist
                       '((text-mode font-lock-comment-face
                                    git-commit-comment-action
                                    git-commit-comment-branch-local
                                    git-commit-comment-branch-remote
                                    git-commit-comment-detached
                                    git-commit-comment-file
                                    git-commit-comment-heading)))
  ;; Start a syntax check so that changes to
  ;; flymake-languagetool-ignore-faces-alist take effect.
  (flymake-start '(post-command on-display)))

(with-eval-after-load 'git-commit
  (add-hook 'git-commit-setup-hook
            #'cnr/git-commit/disable-languagetool-in-comments))

(provide 'init-flymake)

;;; init-flymake.el ends here
