;;; init-projectile.el --- Projectile configuration  -*- lexical-binding: t; -*-

;;; Commentary:
;;

;;; Code:
(require 'package)

(unless (package-installed-p 'projectile)
  (package-install 'projectile))

(require 'projectile)
(projectile-mode 1)

(defun cnr/projectile-test-project ()
  "Run tests without prompting for command."
  (interactive)
  (let* ((command (projectile-default-test-command
                   (projectile-project-type))))
    (projectile-run-compilation command)))


(define-key projectile-mode-map (kbd "C-c p")       #'projectile-command-map)
(define-key projectile-mode-map (kbd "C-c C-c C-c") #'cnr/projectile-test-project)


(customize-set-variable 'projectile-project-search-path '(("~/github" . 1)))
(customize-set-variable 'projectile-create-missing-test-files t)
(customize-set-variable 'projectile-current-project-on-switch 'keep)

;; The project type for Ruby + Minitest defined in projectile.el,
;; ruby-test, does not work properly. For example, it does not
;; create missing test files. Setting :test-dir solves the problem.
(projectile-update-project-type 'ruby-test
                                :test-dir "test/"
                                :test-prefix "test_"
                                :test-suffix nil)


(provide 'init-projectile)
;;; init-projectile.el ends here
