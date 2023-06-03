;;; init-ansible.el --- Ansible configuration  -*- lexical-binding: t; -*-

;;; Commentary:
;;
;;  TODO: check if ansible-doc has indeed been deprecated


;;; Code:
(require 'package)

(unless (package-installed-p 'ansible-doc)
  (package-install 'ansible-doc))

(unless (package-installed-p 'yaml-mode)
  (package-install 'yaml-mode))


(with-eval-after-load 'yaml-mode
  (require 'ansible-doc)
  (defun cnr/ansible-doc-mode ()
    "Enable `ansible-doc-mode' in properly named files."
    (let ((file (file-name-nondirectory (buffer-file-name))))
      (when (or (string= file "main.yml")
                (string= file "playbook.yml"))
        (ansible-doc-mode))))
  (add-hook 'yaml-mode-hook #'cnr/ansible-doc-mode))


(with-eval-after-load 'comint
  (let ((ansible-become-prompt-regexp "^BECOME password:[[:space:]]*\\'"))
    (unless (string-match-p (regexp-quote ansible-become-prompt-regexp)
                            comint-password-prompt-regexp)
      (customize-set-variable 'comint-password-prompt-regexp
                              (concat comint-password-prompt-regexp
                                      "\\|"
                                      ansible-become-prompt-regexp)
                              "Make Emacs prompt for BECOME password."))))


(require 'yaml-mode)


(provide 'init-ansible)

;;; init-ansible.el ends here
