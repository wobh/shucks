;;; init-paredit.el --- configure Emacs lisp mode

(require 'paredit)

;; http://offbytwo.com/2012/01/15/emacs-plus-paredit-under-terminal.html
(when (eq system-type 'darwin)
  (define-key paredit-mode-map (kbd "M-[") nil))

;;;###autoload
(defun turn-on-paredit ()
  (paredit-mode t))

(provide 'init-paredit)
;;; init-paredit.el ends here
