;; -*- mode: emacs-lisp; -*-
;;; init-darwin.el --- Configure Emacs on Darwin

(when (or (memq window-system '(mac ns))
	  (and (daemonp) (eq system-type 'darwin)))
  (exec-path-from-shell-initialize))

(provide 'init-darwin)
;;; ~/.emacs.d/init-darwin.el ends here
