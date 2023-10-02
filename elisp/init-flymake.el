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

(defun cnr/text-mode/flymake-languagetool ()
  "Enable flymake and languagetool strictly for text-mode.

This function is meant to be added to `text-mode-hook'. It enables
flymake and languagetool if the buffer's major mode is exactly
text-mode. This prevents languagetool from running for major modes that
derive from text-mode, such as yaml-mode and nxml-mode."
  (interactive)
  (when (eq major-mode 'text-mode)
    (flymake-languagetool-load)
    (flymake-mode)))

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

(add-hook 'text-mode-hook #'cnr/text-mode/flymake-languagetool)

(with-eval-after-load 'git-commit
  (add-hook 'git-commit-setup-hook
            #'cnr/git-commit/disable-languagetool-in-comments))

(provide 'init-flymake)

;;; init-flymake.el ends here
