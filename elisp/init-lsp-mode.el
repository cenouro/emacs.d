;;; init-lsp-mode.el --- lsp-mode configuration  -*- lexical-binding: t; -*-

;;; Commentary:
;;

;;; Code:
(require 'package)
(unless (package-installed-p 'lsp-mode)
  (package-install 'lsp-mode))

(let ((mb (* 1024 1024)))
  ;; Ensure performance
  (customize-set-variable 'gc-cons-threshold (* 128 mb))
  (customize-set-variable 'read-process-output-max (* 4 mb)))


(customize-set-variable 'lsp-keymap-prefix "C-c l"
                        "Must be set before requiring lsp-mode")

(customize-set-variable 'lsp-enable-suggest-server-download nil)
(customize-set-variable 'lsp-headerline-breadcrumb-enable nil)

(customize-set-variable 'lsp-modeline-diagnostics-scope :file
                        (concat "I consider :global/:workspace errors "
                                "on a file without errors to be "
                                "distracting and misleading."))


(require 'lsp-mode)

(customize-set-variable 'lsp-enabled-clients 'none
                        (concat "Disable all so that we can enable "
                                "lsp-mode only when in a project."))

(defun cnr/lsp-mode/enable-only-if-inside-project ()
  "Enable LSP only for files/buffers belonging to a project."
  (when (project-current)
    ;; enable all clients locally
    (setq-local lsp-enabled-clients nil)
    (lsp-deferred)))


;;; LanguageTool configuration
(unless (package-installed-p 'lsp-ltex)
  (package-install 'lsp-ltex))
(require 'lsp-ltex)
(add-hook 'text-mode-hook #'cnr/lsp-mode/enable-only-if-inside-project)


;;; Ruby configurations
(customize-set-variable 'lsp-sorbet-use-bundler t)
(add-hook 'ruby-mode-hook #'cnr/lsp-mode/enable-only-if-inside-project)


;;; Corfu integration
(with-eval-after-load 'corfu
  (defun corfu/lsp-mode-setup-completion ()
    "From Corfu wiki"
    (setf (alist-get 'styles
                     (alist-get 'lsp-capf completion-category-defaults))
          '(orderless)))

  (customize-set-variable 'lsp-comletion-provider :none "For using Corfu")
  (add-hook 'lsp-completion-mode-hook #'corfu/lsp-mode-setup-completion))


(provide 'init-lsp-mode)
;;; init-lsp-mode.el ends here
