;;; init-lisp.el --- configure lisp mode

(define-key lisp-mode-shared-map (kbd "RET") 
  'reindent-then-newline-and-indent)

(defun setup-lisp-indent-function ()
  (set (make-local-variable 'lisp-indent-function)
       'common-lisp-indent-function))

(defun setup-lisp-indent-tabs (&optional tabs)
  (setq indent-tabs-mode (not (not tabs))))

(add-hook 'lisp-mode-hook
	  'setup-lisp-indent-function
	  'setup-lisp-indent-tabs)

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

;; misc

(defun get-clunk-buffer-create ()
  (interactive )
  (let ((name "*clunk*"))
    (get-buffer-create name)
    (set-buffer name)
    (lisp-mode)
    (setup-lisp-indent-tabs t)
    (switch-to-buffer-other-window name)))

(provide 'init-lisp)
;;; init-lisp.el ends here
