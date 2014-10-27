;; -*- mode: emacs-lisp; -*-
;;; init-darwin.el --- Configure Emacs on Darwin

(when (string-equal system-type "darwin")
       (setq launch-sys-clisp 
	     (list "clisp" ""))
       )

(provide 'init-darwin)
;;; ~/.emacs.d/init-darwin.el ends here
