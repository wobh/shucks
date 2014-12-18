;;; init-lisp.el --- configure lisp mode

(define-key lisp-mode-shared-map (kbd "RET") 
  'reindent-then-newline-and-indent)

(add-hook 'lisp-mode-hook
          (lambda ()
            (set (make-local-variable 'lisp-indent-function)
                 'common-lisp-indent-function)))

(add-to-list 'auto-mode-alist '("\\.cl" . lisp-mode))

(require 'init-slime)

(add-hook 'lisp-mode-hook 'turn-on-slime)

(require 'info-look)

(info-lookup-add-help
 :mode 'lisp-mode
 :regexp "[^][()'\" \t\n]+"
 :ignore-case t
 :doc-spec '(("(ansicl)Symbol Index" nil nil nil)))


(require 'init-paredit)

(add-hook 'lisp-mode-hook 'turn-on-paredit)

(provide 'init-lisp)
;;; init-lisp.el ends here
