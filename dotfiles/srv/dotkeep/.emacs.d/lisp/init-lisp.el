;;; init-lisp.el --- configure lisp mode

(define-key lisp-mode-shared-map (kbd "RET") 
  'reindent-then-newline-and-indent)

(require 'init-slime)

(add-hook 'lisp-mode-hook 'turn-on-slime)

(require 'init-paredit)

(add-hook 'lisp-mode-hook 'turn-on-paredit)

(provide 'init-lisp)
;;; init-lisp.el ends here
