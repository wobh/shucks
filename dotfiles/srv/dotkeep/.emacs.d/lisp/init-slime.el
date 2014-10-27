;;; init-slime.el --- configure lisp mode

(define-key lisp-mode-shared-map (kbd "\C-cs") 'slime-selector)

(setq slime-net-coding-system 'utf-8-unix)

(setq slime-lisp-implementations
      (list
       (list 'clisp (list "clisp" "-K full" "-I" "-ansi"))))

(setq inferior-lisp-program "clisp -K full -I")

(add-hook 'lisp-mode-hook
          (lambda ()
            (set (make-local-variable 'lisp-indent-function)
                 'common-lisp-indent-function)))

(defun turn-on-slime ()
  (slime-mode t))

(require 'slime-autoloads)

(eval-after-load "slime"
  '(progn
     (slime-setup '(slime-fancy slime-banner slime-autodoc)) ; slime-asdf
     (setq slime-complete-symbol*-fancy t
	   slime-complete-symbol-function 'slime-fuzzy-complete-symbol
	   common-lisp-hyperspec-root "file:~/doc/HyperSpec-7-0/HyperSpec/")))

(provide 'init-slime)
;;; init-slime.el ends here