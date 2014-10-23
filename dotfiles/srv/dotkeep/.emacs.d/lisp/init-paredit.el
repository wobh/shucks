;;; init-paredit.el --- configure Emacs lisp mode

(require 'paredit)

;;;###autoload
(defun turn-on-paredit ()
  (paredit-mode t))

(provide 'init-paredit)
;;; init-paredit.el ends here
