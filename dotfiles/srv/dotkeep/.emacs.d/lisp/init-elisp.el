;;; init-elisp.el --- configure Emacs lisp mode

(setq initial-scratch-message nil)

(require 'eldoc)

(add-hook 'emacs-lisp-mode-hook 'turn-on-eldoc-mode)
(add-hook 'ielm-mode-hook 'turn-on-eldoc-mode)

(require 'init-paredit)

(add-hook 'emacs-lisp-mode-hook 'turn-on-paredit)
(add-hook 'ielm-mode-hook 'turn-on-paredit)

(eldoc-add-command
 'paredit-backward-delete
 'paredit-close-round)

(provide 'init-elisp)
;;; init-elisp.el ends here
