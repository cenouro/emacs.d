;;; init-flymake.el --- Flymake settings  -*- lexical-binding: t; -*-

;;; Commentary:

;; TODO: improve text-mode-hook: yaml, xml and probably other modes
;;       inherit from text-mode instead of prog-mode. the hook logic
;;       should not just enable languagetool everywhere.

;; TODO: make languagetool ignore "errors" in git_commit comments.
;;       this can probably be achieved by configuring
;;       flymake-languagetool-ignore-faces-alist.

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

(add-hook 'text-mode-hook #'(lambda()
                              (flymake-languagetool-load)
                              (flymake-mode)))


(provide 'init-flymake)

;;; init-flymake.el ends here
