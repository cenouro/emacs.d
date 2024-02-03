;;; init-custom.el ---  -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:
(customize-set-variable 'custom-file "~/.emacs.d/custom.el"
                        (concat "must be set and loaded as early as "
                                "possible to avoid problems"))
(load custom-file)

(defun my/customize-set-variable (&rest comment)
  "My decorated `customize-set-variable'.

The standard `customize-set-variable' has COMMENT as it's last
argument, which can lead to weird indentation and ugly code. This
function has COMMENT at the beginning, which should provide
better legibility.

More than one COMMENT string can be used, in which case the
strings will be properly joined using a space as separator.

VARIABLE and VALUE are both required and will be passed directly
to `customize-set-variable'.

\(fn [COMMENT...] VARIABLE VALUE\)"
  (let* ((args comment)
         (variable-and-value (last args 2))
         (comments (butlast args 2)))
    (when (length< args 2)
      (signal 'wrong-number-of-arguments
              "at least 2 arguments are required"))
    (customize-set-variable (nth 0 variable-and-value)
                            (nth 1 variable-and-value)
                            (string-trim (string-join comments " ")))))

(provide 'init-custom)
;;; init-custom.el ends here
