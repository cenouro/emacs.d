;;; init-flymake.el --- Flymake settings  -*- lexical-binding: t; -*-

;;; Commentary:
;;

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
